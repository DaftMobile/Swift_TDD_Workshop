import UIKit
import SnapKit
import FirebaseDatabase

class RootControllerFactoryImpl: RootControllerFactory {
	func makeRootController() -> UIViewController {
		let tabBar = UITabBarController()
		let viewControllers: [UIViewController] = [TDDRulesViewController(), PokemonViewController(), PhotoLibraryViewController(), PollViewController()]
		tabBar.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0) }
		return tabBar
	}
}







