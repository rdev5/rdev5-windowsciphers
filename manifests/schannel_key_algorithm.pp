define windowsciphers::schannel_key_algorithm($enable_algorithm = undef, $disable_algorithm = undef) {
	if $disable_algorithm != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${disable_algorithm}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}
	}

	if $enable_algorithm != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${enable_algorithm}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}
	}
}
