import Foundation

protocol PokemonProviding {
	var pokemon: [Pokemon] { get }
	func reload(completion: @escaping () -> Void)
}

class PokemonProvider: PokemonProviding {

	var pokemon: [Pokemon] = []

	func reload(completion: @escaping () -> Void) {
		DispatchQueue.global().async {
			self.pokemon = [
				Pokemon(name: "Bulbasaur", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
				Pokemon(name: "Squirtle", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
				Pokemon(name: "Charmander", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
			]
			DispatchQueue.main.async(execute: completion)
		}
	}
}
