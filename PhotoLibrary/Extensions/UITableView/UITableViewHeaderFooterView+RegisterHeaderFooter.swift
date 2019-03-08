import UIKit

extension UITableView {
	public func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerFooterType: T.Type) {
		register(headerFooterType, forHeaderFooterViewReuseIdentifier: headerFooterType.reuseIdentifier)
	}
}
