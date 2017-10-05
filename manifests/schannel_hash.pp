define windowsciphers::schannel_hash($enable_hash = undef, $disable_hash = undef) {
	if $disable_hash != undef {
		$disable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${disable_hash}"
		registry_key { $disable_registry_key: ensure => present }

		registry_value { "${disable_registry_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => Registry_key[$disable_registry_key],
		}
	}

	if $enable_hash != undef {
		$enable_registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${enable_hash}"
		registry_key { $enable_registry_key: ensure => present }

		registry_value { "${enable_registry_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => Registry_key[$enable_registry_key],
		}
	}
}
