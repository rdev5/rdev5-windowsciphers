# Disables hash in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes
define windowsciphers::hash::disable($hash) {
	registry_value { "HKLM\\System\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Hashes\\${hash}\\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}