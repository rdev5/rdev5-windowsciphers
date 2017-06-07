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
