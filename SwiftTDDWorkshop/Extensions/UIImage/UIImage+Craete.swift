import UIKit

extension UIImage {
	class func create(size: CGSize, color: UIColor) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
		guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
		let rectToFill = CGRect(origin: .zero, size: size)
		context.setFillColor(color.cgColor)
		context.fill(rectToFill)
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else { fatalError() }
		UIGraphicsEndImageContext()
		return image
	}
}
