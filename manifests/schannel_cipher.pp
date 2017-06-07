define windowsciphers::schannel_cipher($enable_cipher = undef, $disable_cipher = undef) {
	if $disable_cipher != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${disable_cipher}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}
	}

	if $enable_cipher != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\${enable_cipher}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}
	}
}
