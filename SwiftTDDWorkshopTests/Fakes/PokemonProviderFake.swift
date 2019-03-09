import Foundation
@testable import Swift_TDD_Workshop

class PokemonProviderFake: PokemonProviding {

	var reloadCalled = false
	var completion: (() -> ())?

	func simulateSuccessfulReload(items: [Pokemon]) {
		self.pokemon = items
		self.completion?()
	}

	var pokemon: [Pokemon] = []

	func reload(completion: @escaping () -> Void) {
		self.reloadCalled = true
		self.completion = completion
	}
}
