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
