class windowsciphers::schannel::disable ($protocols = [], $ciphers = [], $hashes = [], $key_algorithms = [], $copyToClient = false) {
	validate_array($protocols)
	validate_array($ciphers)
	validate_array($hashes)
	validate_array($key_algorithms)

	$ciphers.each |$cipher| {
		windowsciphers::schannel_cipher { "Disable ${cipher}":
			disable_cipher => $cipher
		}
	}

	$hashes.each |$hash| {
		windowsciphers::schannel_hash { "Disable ${hash}":
			disable_hash => $hash
		}
	}

	$key_algorithms.each |$key_algorithm| {
		windowsciphers::schannel_key_algorithm { "Disable ${key_algorithm}":
			disable_key_algorithm => $key_algorithm
		}
	}

	$protocols.each |$protocol| {
		windowsciphers::schannel_protocol { "Disable ${protocol}":
			disable_protocol => $protocol,
			copyToClient => $copyToClient,
		}
	}
}
