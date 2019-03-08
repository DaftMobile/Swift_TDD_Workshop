import UIKit

extension UICollectionView {
	public func dequeueSupplementaryView<T: UICollectionReusableView>(_ viewType: T.Type, ofKind kind: String, for indexPath: IndexPath) -> T {
		guard let supplementaryView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: viewType.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Could not dequeue supplementary view with reuse identifier: \(viewType.reuseIdentifier) of kind: \(kind) for \(indexPath)")
		}
		return supplementaryView
	}
}
