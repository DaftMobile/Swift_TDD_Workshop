import UIKit

class TDDRulesViewController: UIViewController {
	var collectionView: UICollectionView { return view as! UICollectionView }
	let layout = UICollectionViewFlowLayout()

	var dataSource: TDDRulesDataSource = TDDRulesDataSource()

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
		let item = dataSource.rules[indexPath.item]
		let cell = collectionView.dequeueCell(TDDRuleCollectionViewCell.self, for: indexPath)
		cell.setup(text: item.name, color: item.color)
		return cell
	}
}
