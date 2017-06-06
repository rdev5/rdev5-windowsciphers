class windowsciphers () {
	class { 'registry': }
}

# Disables protocol for both client and server in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols
define windowsciphers::disable::protocol($protocol) {
	windowsciphers::disable::server_protocol($protocol);
	windowsciphers::disable::client_protocol($protocol);
}

define windowsciphers::disable::server_protocol($protocol) {
	registry_value { "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\${protocol}\Server\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}

	registry_value { "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\${protocol}\Server\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000001
	}
}

define windowsciphers::disable::client_protocol($protocol) {
	registry_value { "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\${protocol}\Client\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}

	registry_value { "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\${protocol}\Client\DisabledByDefault":
		ensure => present,
		type => dword,
		data => 0x00000001
	}
}

# Disables cipher in HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers
define windowsciphers::disable::cipher($cipher) {
	registry_value { "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\${cipher}\Enabled":
		ensure => present,
		type => dword,
		data => 0x00000000
	}
}

# Sets cipher suites in SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002
define windowsciphers::cipher_suite($suite) {
	# TODO
}

class windowsciphers::disable (
	$schannel_protocols = ["Multi-Protocol Unified Hello", PCT 1.0", "SSL 2.0", "SSL 3.0", "TLS 1.0"]

	$schannel_ciphers = [
		"NULL",
		"DES 56/56",
		"RC2 40/128",
		"RC2 56/128",
		"RC2 128/128",
		"RC4 40/128",
		"RC4 56/128",
		"RC4 64/128",
		"RC4 128/128",
		"Triple DES 168"
	]

	$cipher_suite = [
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521",
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384",
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P521",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P384",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256",
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P521",
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384",
		"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P256",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P521",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P384",
		"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256",
		"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P256",
		"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P256",
		"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P256",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P521",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P384",
		"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P256",
		"TLS_RSA_WITH_AES_256_GCM_SHA384",
		"TLS_RSA_WITH_AES_128_GCM_SHA256",
		"TLS_RSA_WITH_AES_256_CBC_SHA256",
		"TLS_RSA_WITH_AES_128_CBC_SHA256",
		"TLS_RSA_WITH_AES_256_CBC_SHA",
		"TLS_RSA_WITH_AES_128_CBC_SHA"
	]
) {
	$schannel_protocols.each |$protocol| {
		windowsciphers::disable::protocol($protocol);
	}

	$schannel_ciphers.each |$cipher| {
		windowsciphers::disable::cipher($cipher);
	}

	windowsciphers::cipher_suite($cipher_suite);
}