import UIKit
import SnapKit
import FirebaseDatabase
import UIImageAutoresize

class RootControllerFactoryImpl: RootControllerFactory {
	func makeRootController() -> UIViewController {
		return UINavigationController(rootViewController: PhotoLibraryViewController())
	}
}







