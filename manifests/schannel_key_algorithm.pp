# TODO: Refactor into separate functions
define windowsciphers::schannel_key_algorithm($enable_key_algorithm = undef, $disable_key_algorithm = undef) {
	if $disable_key_algorithm != undef {
		$disable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${disable_key_algorithm}"
		registry_key { $disable_registry_key: ensure => present }

		registry_value { "${disable_registry_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => Registry_key[$disable_registry_key],
		}
	}

	if $enable_key_algorithm != undef {
		$enable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${enable_key_algorithm}"
		registry_key { $enable_registry_key: ensure => present }

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\KeyExchangeAlgorithms\\${enable_key_algorithm}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => Registry_key[$enable_registry_key],
		}
	}
}
