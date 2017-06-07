define windowsciphers::schannel_key_algorithm($enable_key_algorithm = undef, $disable_key_algorithm = undef) {
	if $disable_key_algorithm != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${disable_key_algorithm}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}
	}

	if $enable_key_algorithm != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${enable_key_algorithm}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}
	}
}
