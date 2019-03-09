import UIKit

class PokemonViewController: UITableViewController {

	var pokemonProvider: PokemonProviding!

	// MARK: Initialisers
	init() {
		super.init(style: .plain)
		self.title = "Pokemon"
		self.pokemonProvider = PokemonProvider()
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	// MARK: Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerCell(PokemonTableViewCell.self)

		// TODO: reload
	}

	// MARK: Table view

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueCell(PokemonTableViewCell.self)
		return cell
	}
}
