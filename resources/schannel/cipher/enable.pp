define windowsciphers::schannel::cipher::enable($cipher) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${cipher}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}
