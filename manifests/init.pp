class windowsciphers () {
	class { 'registry': }
}

# Disables protocol for both client and server in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols
define windowsciphers::disable::protocol($protocol) {
	windowsciphers::disable::server_protocol($protocol)
	windowsciphers::disable::client_protocol($protocol)
}

define windowsciphers::disable::server_protocol($protocol) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}

	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000001
	}
}

define windowsciphers::disable::client_protocol($protocol) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}

	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000001
	}
}

# Disables cipher in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers
define windowsciphers::disable::cipher($cipher) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${cipher}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

# Sets cipher suites in SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002
define windowsciphers::cipher_suite($suite) {
	# TODO
}

class windowsciphers::disable ($schannel_protocols = [], $schannel_ciphers = [], $cipher_suite = []) {
	$schannel_protocols.each |$protocol| {
		windowsciphers::disable::protocol($protocol)
	}

	$schannel_ciphers.each |$cipher| {
		windowsciphers::disable::cipher($cipher)
	}

	windowsciphers::cipher_suite($cipher_suite)
}