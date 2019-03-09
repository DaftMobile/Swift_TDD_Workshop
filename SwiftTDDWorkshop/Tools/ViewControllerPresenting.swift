import UIKit

protocol ViewControllerPresenter {
	var sourceController: UIViewController? { get set }

	func present(viewController: UIViewController)
	func dismiss(viewController: UIViewController)
}

class DefaultViewControllerPresenter: ViewControllerPresenter {
	weak var sourceController: UIViewController?

	func present(viewController: UIViewController) {
		sourceController?.present(viewController, animated: true, completion: nil)
	}

	func dismiss(viewController: UIViewController) {
		viewController.dismiss(animated: true, completion: nil)
	}
}
