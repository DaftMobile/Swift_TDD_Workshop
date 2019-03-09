import UIKit
import SnapKit

class PokemonTableViewCell: UITableViewCell {
	private let label = UILabel()
	private let dotView = UIView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(dotView)
		addSubview(label)
		setupLayout()
	}

	func setup(pokemon: Pokemon) {
		self.label.text = pokemon.name
		self.dotView.backgroundColor = pokemon.uiColor
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	private func setupLayout() {
		dotView.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(15)
			$0.width.height.equalTo(16)
			$0.centerY.equalToSuperview()
		}

		label.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(40)
			$0.centerY.equalToSuperview()
		}

		dotView.layer.cornerRadius = 8
	}
}
