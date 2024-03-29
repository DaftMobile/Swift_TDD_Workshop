import UIKit

class PokemonViewController: UITableViewController {

	var pokemonProvider: PokemonProviding!

	// MARK: Initialisers
	init() {
		super.init(style: .plain)
		self.title = "Pokemon"
		self.tabBarItem = .init(title: "Pokemon", image: .init(systemName: "pawprint"), tag: 1)
		self.pokemonProvider = PokemonProvider()
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	// MARK: Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerCell(PokemonTableViewCell.self)

		// TODO: Task 2
		// TODO: Reload
	}

	// MARK: Table view

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pokemonProvider.pokemon.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueCell(PokemonTableViewCell.self)
		cell.setup(pokemon: pokemonProvider.pokemon[indexPath.row])
		return cell
	}
}
