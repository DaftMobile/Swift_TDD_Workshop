import UIKit

extension UITableView {
	public func dequeueHeaderFooter<T: Reusable>(_ viewType: T.Type) -> T {
		let reuseIdentifier = viewType.reuseIdentifier

		guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
			fatalError("Could not dequeue header footer view with reuse identifier: \(reuseIdentifier)")
		}
		return headerFooterView
	}
}
