import UIKit

extension UITableView {
	public func registerCell<T: UITableViewCell>(_ cellType: T.Type) {
		register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
	}
}
