import UIKit

extension UICollectionView {
	public func registerSupplementaryView<T: UICollectionReusableView>(_ viewType: T.Type, forKind kind: String) {
		register(viewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: viewType.reuseIdentifier)
	}
}
