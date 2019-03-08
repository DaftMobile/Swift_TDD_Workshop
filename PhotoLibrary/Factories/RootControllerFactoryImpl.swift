import UIKit
import SnapKit

class RootControllerFactoryImpl: RootControllerFactory {
	func makeRootController() -> UIViewController {
		return UINavigationController(rootViewController: Cont())
	}
}

class Cont: UIViewController {
	override func loadView() {
		self.view = UIView()
		let sub = UIView()

		view.addSubview(sub)
		sub.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.height.equalTo(200)
		}

		sub.backgroundColor = .blue
		view.backgroundColor = .orange
	}
}
