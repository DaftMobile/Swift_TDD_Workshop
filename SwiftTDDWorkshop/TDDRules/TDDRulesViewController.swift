import UIKit

class TDDRulesViewController: UIViewController {
	var collectionView: UICollectionView { return view as! UICollectionView }
	let layout = UICollectionViewFlowLayout()

	private let rules: [(String, UIColor)] = [
		("RED", #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
		("GREEN", #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
		("REFACTOR", #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
	]

	init() {
		super.init(nibName: nil, bundle: nil)
		self.title = "Rules"
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	override func loadView() {
		self.view = UICollectionView(frame: .zero, collectionViewLayout: layout)

		layout.scrollDirection = .vertical
		view.backgroundColor = .white
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.registerCell(TDDRuleCollectionViewCell.self)
		collectionView.dataSource = self
		collectionView.alwaysBounceVertical = true
	}
}

extension TDDRulesViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let model = self.rules[indexPath.item]
		let cell = collectionView.dequeueCell(TDDRuleCollectionViewCell.self, for: indexPath)
		cell.setup(text: model.0, color: model.1)
		return cell
	}
}
