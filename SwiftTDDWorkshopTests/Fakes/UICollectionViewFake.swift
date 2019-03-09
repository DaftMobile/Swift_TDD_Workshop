import UIKit

class UICollectionViewFake: UICollectionView {
    var reloadDataCalled = false

    override func reloadData() {
        reloadDataCalled = true
    }
}
