class windowsciphers::schannel::enable ($protocols = [], $ciphers = [], $hashes = [], $keyAlgorithms = []) {
	validate_array($protocols)
	validate_array($ciphers)
	validate_array($hashes)
	validate_array($keyAlgorithms)

	$protocols.each |$protocol| {
		windowsciphers::schannel::protocol::enable { $protocol:
			protocol => $protocol
		}
	}

	$ciphers.each |$cipher| {
		windowsciphers::schannel::cipher::enable { $cipher:
			cipher => $cipher
		}
	}

	$hashes.each |$hash| {
		windowsciphers::schannel::hash::enable { $hash:
			hash => $hash
		}
	}

	$keyAlgorithms.each |$algorithm| {
		windowsciphers::schannel::key_exchange::enable { $algorithm:
			algorithm => $algorithm
		}
	}
}
