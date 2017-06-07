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
