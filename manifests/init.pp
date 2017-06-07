class windowsciphers () {
	class { 'registry': }
}

class windowsciphers::schannel::disable ($protocols = [], $ciphers = [], $hashes = [], $keyAlgorithms = []) {
	$protocols.each |$protocol| {
		windowsciphers::schannel::protocol::disable { $protocol:
			protocol => $protocol
		}
	}

	$ciphers.each |$cipher| {
		windowsciphers::schannel::cipher::disable { $cipher:
			cipher => $cipher
		}
	}

	$hashes.each |$hash| {
		windowsciphers::schannel::hash::disable { $hash:
			hash => $hash
		}
	}

	$keyAlgorithms.each |$algorithm| {
		windowsciphers::schannel::key_exchange::disable { $algorithm:
			algorithm => $algorithm
		}
	}
}
