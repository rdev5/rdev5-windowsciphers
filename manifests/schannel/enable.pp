class windowsciphers::schannel::enable ($protocols = [], $ciphers = [], $hashes = [], $key_algorithms = []) {
	validate_array($protocols)
	validate_array($ciphers)
	validate_array($hashes)
	validate_array($key_algorithms)

	$ciphers.each |$cipher| {
		windowsciphers::schannel_cipher { "Enable ${cipher}":
			enable_cipher => $cipher
		}
	}

	$hashes.each |$hash| {
		windowsciphers::schannel_hash { "Enable ${hash}":
			enable_hash => $hash
		}
	}

	$key_algorithms.each |$key_algorithm| {
		windowsciphers::schannel_key_algorithm { "Enable ${key_algorithm}":
			enable_key_algorithm => $key_algorithm
		}
	}

	$protocols.each |$protocol| {
		windowsciphers::schannel_protocol { "Enable ${protocol}":
			enable_protocol => $protocol
		}
	}
}
