import UIKit

extension Reusable where Self: UIView {
	public static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionReusableView: Reusable {}
