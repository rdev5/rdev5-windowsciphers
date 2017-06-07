# Disables protocol for both client and server in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols
define windowsciphers::protocol::disable($protocol) {
	windowsciphers::protocol::server::disable { $protocol:
		protocol => $protocol
	}

	windowsciphers::protocol::client::disable { $protocol:
		protocol => $protocol
	}
}

define windowsciphers::protocol::server::disable($protocol) {
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

define windowsciphers::protocol::client::disable($protocol) {
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