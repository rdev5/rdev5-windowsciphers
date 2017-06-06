class windowsciphers () {
	class { 'registry': }
}

class windowsciphers::disable ($schannel_protocols = [], $schannel_ciphers = []) {
	$schannel_protocols.each |$protocol| {
		windowsciphers::protocol::disable { $protocol:
			protocol => $protocol
		}
	}

	$schannel_ciphers.each |$cipher| {
		windowsciphers::cipher::disable { $cipher:
			cipher => $cipher
		}
	}
}