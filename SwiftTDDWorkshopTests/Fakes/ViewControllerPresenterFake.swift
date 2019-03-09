import Foundation
import UIKit

@testable import Swift_TDD_Workshop

class ViewControllerPresenterFake: ViewControllerPresenter {

    var capturedPresentedViewController: UIViewController?
    var capturedDismissedViewController: UIViewController?

    weak var sourceController: UIViewController?

    func present(viewController: UIViewController) {
        capturedPresentedViewController = viewController
    }

    func dismiss(viewController: UIViewController) {
        capturedDismissedViewController = viewController
    }

}
