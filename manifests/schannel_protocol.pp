# TODO: Refactor into helpers and cleanup
define windowsciphers::schannel_protocol($enable_protocol = undef, $disable_protocol = undef) {
	if $disable_protocol != undef {
		$disable_server_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Server"
		$disable_client_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${disable_protocol}\\Client"
		
		registry_key { $disable_server_protocol_key: ensure => present }
		registry_key { $disable_client_protocol_key: ensure => present }

		# Disable server protocols
		registry_value { "${disable_server_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$disable_server_protocol_key],
				Registry_key[$disable_client_protocol_key],
			],
		}

		registry_value { "${disable_server_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001,
			require => [
				Registry_key[$disable_server_protocol_key],
				Registry_key[$disable_client_protocol_key],
			],
		}

		# Disable client protocols
		registry_value { "${disable_client_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$disable_server_protocol_key],
				Registry_key[$disable_client_protocol_key],
			],
		}

		registry_value { "${disable_client_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001,
			require => [
				Registry_key[$disable_server_protocol_key],
				Registry_key[$disable_client_protocol_key],
			],
		}
	}

	if $enable_protocol != undef {
		$enable_server_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Server"
		$enable_client_protocol_key = "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${enable_protocol}\\Client"
		
		registry_key { $enable_server_protocol_key: ensure => present }
		registry_key { $enable_client_protocol_key: ensure => present }

		# Enable server protocols
		registry_value { "${enable_server_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => [
				Registry_key[$enable_server_protocol_key],
				Registry_key[$enable_client_protocol_key],
			],
		}

		registry_value { "${enable_server_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$enable_server_protocol_key],
				Registry_key[$enable_client_protocol_key],
			],
		}

		# Enable client protocols
		registry_value { "${enable_client_protocol_key}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff,
			require => [
				Registry_key[$enable_server_protocol_key],
				Registry_key[$enable_client_protocol_key],
			],
		}

		registry_value { "${enable_client_protocol_key}\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000,
			require => [
				Registry_key[$enable_server_protocol_key],
				Registry_key[$enable_client_protocol_key],
			],
		}
	}
}
