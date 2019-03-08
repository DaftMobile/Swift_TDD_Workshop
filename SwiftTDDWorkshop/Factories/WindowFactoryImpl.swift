import UIKit

class WindowFactoryImpl: WindowFactory {
	func createWindow(rootViewController: UIViewController) -> UIWindow {
		let window = UIWindow()
		window.rootViewController = rootViewController
		return window
	}
}
