import Foundation
import UIKit
@testable import Swift_TDD_Workshop

class ImageManipulatorFake: ImageManipulator {

    var capturedImageToScale: UIImage?

	var fakeScaledImage: UIImage = UIImage.create(size: .init(width:2, height: 2), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))

	func scale(image: UIImage, maxDimension: Int) -> UIImage {
		capturedImageToScale = image
		return fakeScaledImage
	}
}
