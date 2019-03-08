import UIKit

protocol WindowFactory {
	func createWindow(rootViewController: UIViewController) -> UIWindow
}
