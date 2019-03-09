import UIKit

class TDDRuleCollectionViewCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(label)
		label.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		label.text = ""
		backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	}

	func setup(text: String, color: UIColor) {
		self.backgroundColor = color
		self.label.text = text
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	private let label: UILabel = {
		let label = UILabel()
		label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		label.font = UIFont.boldSystemFont(ofSize: 24)
		return label
	}()
}
