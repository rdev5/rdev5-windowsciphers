define windowsciphers::hash::disable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

define windowsciphers::hash::enable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}
