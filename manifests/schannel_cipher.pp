define windowsciphers::schannel_cipher($enable_cipher = undef, $disable_cipher = undef) {
	if $disable_cipher != undef {
		$disable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${disable_cipher}"
		registry_key { $disable_registry_key: ensure => present }

		registry_value { "${disable_registry_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => Registry_key[$disable_registry_key],
		}
	}

	if $enable_cipher != undef {
		$enable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${enable_cipher}"
		registry_key { $enable_registry_key: ensure => present }

		registry_value { "${enable_registry_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => Registry_key[$enable_registry_key],
		}
	}
}
