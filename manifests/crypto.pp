class windowsciphers::crypto::functions::set ($functions = []) {
	validate_array($functions)

	if length($functions) > 0 {
		registry_value { "HKLM\\System\\CurrentControlSet\\Control\\Cryptography\\Configuration\\Local\\SSL\\00010002\\Functions":
			ensure => present,
			type => array,
			data => $functions
		}
	}
}
