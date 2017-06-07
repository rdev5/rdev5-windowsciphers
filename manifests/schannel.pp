# Ciphers
define windowsciphers::schannel::cipher::disable($cipher) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${cipher}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::schannel::cipher::enable($cipher) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${cipher}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}

# Hashes
define windowsciphers::schannel::hash::disable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::schannel::hash::enable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}

# Key Exchange Algorithms
define windowsciphers::schannel::key_exchange::disable($algorithm) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${algorithm}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::schannel::key_exchange::enable($algorithm) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${algorithm}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}

# Protocols
define windowsciphers::schannel::protocol::server::disable($protocol) {
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

define windowsciphers::schannel::protocol::client::disable($protocol) {
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

define windowsciphers::schannel::protocol::enable($protocol) {
	windowsciphers::schannel::protocol::server::enable { $protocol:
		protocol => $protocol
	}

	windowsciphers::schannel::protocol::client::enable { $protocol:
		protocol => $protocol
	}
}

define windowsciphers::schannel::protocol::server::enable($protocol) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}

	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::schannel::protocol::client::enable($protocol) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}

	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::schannel::protocol::disable($protocol) {
	windowsciphers::schannel::protocol::server::disable { $protocol:
		protocol => $protocol
	}

	windowsciphers::schannel::protocol::client::disable { $protocol:
		protocol => $protocol
	}
}