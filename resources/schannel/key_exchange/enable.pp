define windowsciphers::schannel::key_exchange::enable($algorithm) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${algorithm}\\Enabled":
		ensure => present,
		type => dword,
		data => 0xffffffff
	}
}
