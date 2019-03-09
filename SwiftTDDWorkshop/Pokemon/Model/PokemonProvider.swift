import Foundation

protocol PokemonProviding {
	var pokemon: [Pokemon] { get }
	func reload(completion: @escaping () -> Void)
}

class PokemonProvider: PokemonProviding {

	var pokemon: [Pokemon] = []

	func reload(completion: @escaping () -> Void) {
		DispatchQueue.global().async {
			defer { DispatchQueue.main.async(execute: completion) }
			guard let path = Bundle.main.path(forResource: "pokemon_list", ofType: "json") else { return }
			guard let pokemonList = FileManager.default.contents(atPath: path) else { return }

			self.pokemon = (try? JSONDecoder().decode([Pokemon].self, from: pokemonList)) ?? []
		}
	}
}
