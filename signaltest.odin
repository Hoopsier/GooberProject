package game
SignalType :: struct {
	listeners: [dynamic]proc(),
}

Signal :: proc(sig: ^SignalType) {
	for listener in sig.listeners {
		listener()
	}
}

AddListener :: proc(sig: ^SignalType, listener: proc()) {
	append(&sig.listeners, listener) // sig.listeners = append(sig.listeners, listener)
}
