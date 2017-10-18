# TODO: Refactor into separate functions
define windowsciphers::schannel_protocol($enable_protocol = undef, $disable_protocol = undef, $copyToClient = false) {
	if $disable_protocol != undef {
		# Disable server protocols
		$disable_server_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Server"
		
		registry_key { $disable_server_protocol_key: ensure => present }

		registry_value { "${disable_server_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$disable_server_protocol_key],
			],
		}

		registry_value { "${disable_server_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001,
			require => [
				Registry_key[$disable_server_protocol_key],
			],
		}

		# Disable client protocols
		if $copyToClient {
			$disable_client_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Client"
			
			registry_key { $disable_client_protocol_key: ensure => present }

			registry_value { "${disable_client_protocol_key}\\Enabled":
				ensure => present,
				type => dword,
				data => 0x00000000,
				require => [
					Registry_key[$disable_client_protocol_key],
				],
			}

			registry_value { "${disable_client_protocol_key}\\DisabledByDefault":
				ensure => present,
				type => dword,
				data => 0x00000001,
				require => [
					Registry_key[$disable_client_protocol_key],
				],
			}
		}
	}

	if $enable_protocol != undef {
		# Enable server protocols
		$enable_server_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Server"
		
		registry_key { $enable_server_protocol_key: ensure => present }

		registry_value { "${enable_server_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => [
				Registry_key[$enable_server_protocol_key],
			],
		}

		registry_value { "${enable_server_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$enable_server_protocol_key],
			],
		}

		# Enable client protocols
		if $copyToClient {
			$enable_client_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Client"
			
			registry_key { $enable_client_protocol_key: ensure => present }

			# Enable client protocols
			registry_value { "${enable_client_protocol_key}\\Enabled":
				ensure => present,
				type => dword,
				data => 0xffffffff,
				require => [
					Registry_key[$enable_client_protocol_key],
				],
			}

			registry_value { "${enable_client_protocol_key}\\DisabledByDefault":
				ensure => present,
				type => dword,
				data => 0x00000000,
				require => [
					Registry_key[$enable_client_protocol_key],
				],
			}
		}
	}
}
