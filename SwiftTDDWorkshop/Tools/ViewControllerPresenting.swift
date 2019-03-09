import UIKit

protocol ViewControllerPresenting {
	func present(viewController: UIViewController, in sourceViewController: UIViewController)
	func dismiss(viewController: UIViewController)
}

class DefaultViewControllerPresenter: ViewControllerPresenting {
	func present(viewController: UIViewController, in sourceViewController: UIViewController) {
		sourceViewController.present(viewController, animated: true, completion: nil)
	}

	func dismiss(viewController: UIViewController) {
		viewController.dismiss(animated: true, completion: nil)
	}
}
