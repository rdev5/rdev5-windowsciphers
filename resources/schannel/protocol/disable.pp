define windowsciphers::schannel::protocol::disable($protocol) {
	windowsciphers::schannel::protocol::server::disable { $protocol:
		protocol => $protocol
	}

	windowsciphers::schannel::protocol::client::disable { $protocol:
		protocol => $protocol
	}
}
