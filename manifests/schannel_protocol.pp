define windowsciphers::schannel_protocol($enable_protocol = undef, $disable_protocol = undef) {
	if $disable_protocol != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000001
		}
	}

	if $enable_protocol != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Server\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}

		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\${protocol}\\Client\\DisabledByDefault":
			ensure => present,
			type => dword,
			data => 0x00000000
		}
	}
}
