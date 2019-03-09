import UIKit
import SnapKit
import FirebaseDatabase
import UIImageAutoresize

class RootControllerFactoryImpl: RootControllerFactory {
	func makeRootController() -> UIViewController {
		let tabBar = UITabBarController()
		tabBar.viewControllers = [TDDRulesViewController(), PhotoLibraryViewController()].map { UINavigationController(rootViewController: $0) }
		return tabBar
	}
}







