# Disables both client and server protocols
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

define windowsciphers::protocol::enable($protocol) {
	windowsciphers::protocol::server::enable { $protocol:
		protocol => $protocol
	}

	windowsciphers::protocol::client::enable { $protocol:
		protocol => $protocol
	}
}

define windowsciphers::protocol::server::enable($protocol) {
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

define windowsciphers::protocol::client::enable($protocol) {
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
