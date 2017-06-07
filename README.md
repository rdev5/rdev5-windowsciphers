# rdev5-windowsciphers
Configures Microsoft Schannel and cipher suite selection for ensuring compliance on Windows servers.

## Installation
To use this module, add this declaration to your Puppetfile:
````
mod 'rdev5-windowsciphers',
:git => 'https://github.com/rdev5/rdev5-windowsciphers.git',
:commit => '3d80cfe'
````

## Profiles
### PCI 3.1 + SWEET32 Fix
Disables TLS 1.0, Triple DES, and < 128-bit ciphers:
````
windowsciphers::schannel::disable { 'Disable Schannels':
	$protocols => ["Multi-Protocol Unified Hello", "PCT 1.0", "SSL 2.0", "SSL 3.0", "TLS 1.0"],

	$ciphers => [
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
	],
}

windowsciphers::schannel::enable { 'Enable Schannels':
	$keyAlgorithms => ["Diffie-Hellman", "PKCS", "ECDH"],
	$hashes => ["MD5", "SHA", "SHA256", "SHA384", "SHA512"],
	$protocols => ["TLS 1.1", "TLS 1.2"],
	$ciphers => ["AES 128/128", "AES 256/256"],
}
````

### Cryptography Cipher Suites
To set the following cipher suites in their respective order, use `windowsciphers::crypto::functions::set`:
````
windowsciphers::crypto::functions::set { 'Cipher Suites':
	$functions => [
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
}
````