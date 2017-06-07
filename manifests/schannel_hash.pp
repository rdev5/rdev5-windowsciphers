define windowsciphers::schannel_hash($enable_hash = undef, $disable_hash = undef) {
	if $disable_hash != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${disable_hash}\\Enabled":
			ensure => present,
			type => dword,
			data => 0x00000000
		}
	}

	if $enable_hash != undef {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${enable_hash}\\Enabled":
			ensure => present,
			type => dword,
			data => 0xffffffff
		}
	}
}
