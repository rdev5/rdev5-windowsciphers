define windowsciphers::schannel::hash::enable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}
