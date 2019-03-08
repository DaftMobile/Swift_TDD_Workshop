import UIKit

extension UITableView {
	public func dequeueCell<T: UITableViewCell>(_ cellType: T.Type) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) as? T else {
			fatalError("Could not dequeue cell with reuse identifier: \(cellType.reuseIdentifier)")
		}
		return cell
	}

	public func dequeueCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Could not dequeue cell with reuse identifier: \(cellType.reuseIdentifier) at: \(indexPath)")
		}
		return cell
	}
}
