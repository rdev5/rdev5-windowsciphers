define windowsciphers::schannel::protocol::enable($protocol) {
	windowsciphers::schannel::protocol::server::enable { $protocol:
		protocol => $protocol
	}

	windowsciphers::schannel::protocol::client::enable { $protocol:
		protocol => $protocol
	}
}
