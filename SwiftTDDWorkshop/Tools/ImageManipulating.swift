import UIKit

protocol ImageManipulating {
	func scale(image: UIImage, maxDimension: Int) -> UIImage
}

class DefaultImageManipulator: ImageManipulating {
	func scale(image: UIImage, maxDimension: Int) -> UIImage {
		let size = CGSize(width: maxDimension, height: maxDimension)
		return image.resizedImageToFit(in: size, scaleUpIfSmaller: true)
	}
}
