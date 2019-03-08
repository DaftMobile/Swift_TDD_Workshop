import UIKit
import SnapKit

class PhotoLibraryCollectionViewCell: UICollectionViewCell {

	let imageView = Subviews.imageView
	let nameLabel = Subviews.nameLabel
	let overlayView = Subviews.overlayView

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageView)
		self.clipsToBounds = true

		setUpSelf()
		addSubviews()
		setupLayout()
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	func setup(image: UIImage, name: String) {
		self.imageView.image = image
		self.nameLabel.text = name
	}

	private func setUpSelf() {
		backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		clipsToBounds = true
		layer.cornerRadius = 4.0
	}

	private func addSubviews() {
		overlayView.addSubview(nameLabel)
		addSubview(imageView)
		addSubview(overlayView)
	}

	private func setupLayout() {
		imageView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}

		overlayView.snp.makeConstraints {
			$0.leading.trailing.bottom.equalToSuperview()
			$0.height.equalToSuperview().multipliedBy(0.2)
		}

		nameLabel.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}

extension PhotoLibraryCollectionViewCell {
	enum Subviews {
		static var overlayView: UIView {
			let view = UIView()
			view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
			view.alpha = 0.8
			return view
		}

		static var nameLabel: UILabel {
			let nameLabel = UILabel()
			nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
			nameLabel.textAlignment = .center
			nameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			return nameLabel
		}

		static var imageView: UIImageView {
			let imageView = UIImageView()
			imageView.contentMode = .scaleAspectFill
			return imageView
		}
	}
}
