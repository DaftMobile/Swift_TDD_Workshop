import UIKit

protocol ImageManipulator {
	func scale(image: UIImage, maxDimension: Int) -> UIImage
}

class DefaultImageManipulator: ImageManipulator {
	func scale(image: UIImage, maxDimension: Int) -> UIImage {
		let size = CGSize(width: maxDimension, height: maxDimension)
		return image.resizedImageToFit(in: size, scaleUpIfSmaller: true)
	}
}
