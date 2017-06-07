define windowsciphers::schannel::cipher::disable($cipher) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${cipher}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}