import UIKit
import SnapKit
import FirebaseDatabase
import UIImageAutoresize

class RootControllerFactoryImpl: RootControllerFactory {
	func makeRootController() -> UIViewController {
		let tabBar = UITabBarController()
		let viewControllers: [UIViewController] = [TDDRulesViewController(), PokemonViewController(), PhotoLibraryViewController()]
		tabBar.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0) }
		return tabBar
	}
}







