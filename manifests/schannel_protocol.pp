define windowsciphers::schannel_protocol($enable_protocol = undef, $disable_protocol = undef) {
	if $disable_protocol != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Server\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Server\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Client\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Client\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001
		}
	}

	if $enable_protocol != undef {
		$registry_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}"
		
		registry_key { $registry_key:
			ensure => present,
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Server\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => Registry_key[$registry_key],
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Server\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => Registry_key[$registry_key],
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Client\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => Registry_key[$registry_key],
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Client\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => Registry_key[$registry_key],
		}
	}
}
