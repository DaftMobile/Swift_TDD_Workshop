import UIKit

class TDDRulesCollectionViewLayout: UICollectionViewFlowLayout {
	override init() {
		super.init()
		sectionInset = .zero
		minimumLineSpacing = 5
		minimumLineSpacing = 5
		itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
	}

	required init?(coder aDecoder: NSCoder) { return nil }
}

