import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	let windowFactory = WindowFactoryImpl()
	let controllerFactory = RootControllerFactoryImpl()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		FirebaseApp.configure()
		window = windowFactory.createWindow(rootViewController: controllerFactory.makeRootController())
		window?.makeKeyAndVisible()
		return true
	}
}
