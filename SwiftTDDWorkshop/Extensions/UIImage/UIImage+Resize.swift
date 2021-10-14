import UIKit

extension UIImage {
	public func resized(to size: CGSize) -> UIImage {
		var destinationSize = size

		guard let cgImageRef = self.cgImage else { fatalError("Not backed by CGImage") }
		let sourceSize = CGSize(width: cgImageRef.width, height: cgImageRef.height)

		guard sourceSize != destinationSize else { return self }

		let scaleRatio = destinationSize.width / sourceSize.width

		let transform: CGAffineTransform

		switch(imageOrientation) {
		case .up:
			transform = .identity;
		case .upMirrored:
			transform = CGAffineTransform
				.init(translationX: sourceSize.width, y: 0)
				.scaledBy(x: -1, y: 1)
		case .down:
			transform = CGAffineTransform
				.init(translationX: sourceSize.width, y: sourceSize.height)
				.rotated(by: .pi)
		case .downMirrored:
			transform = CGAffineTransform
				.init(translationX: 0.0, y: sourceSize.height)
				.scaledBy(x: 1, y: -1)
		case .leftMirrored:
			destinationSize = CGSize(width: destinationSize.height, height: destinationSize.width)
			transform = CGAffineTransform
				.init(translationX: sourceSize.height, y: sourceSize.width)
				.scaledBy(x: -1, y: 1)
				.rotated(by: 1.5 * .pi)
		case .left:
			destinationSize = CGSize(width: destinationSize.height, height: destinationSize.width);
			transform = CGAffineTransform
				.init(translationX: 0.0, y: sourceSize.width)
				.rotated(by: 1.5 * .pi)
		case .rightMirrored:
			destinationSize = CGSize(width: destinationSize.height, height: destinationSize.width);
			transform = CGAffineTransform
				.init(scaleX: -1, y: 1)
				.rotated(by: .pi * 0.5)
		case .right:
			destinationSize = CGSize(width: destinationSize.height, height: destinationSize.width);
			transform = CGAffineTransform
				.init(translationX: sourceSize.height, y: 0.0)
				.rotated(by: .pi * 0.5)
		@unknown default:
			fatalError("Unknown orientation, which is weird. But that's Gen Z for you.")
		}

		UIGraphicsBeginImageContextWithOptions(destinationSize, false, scale);
		guard let context = UIGraphicsGetCurrentContext() else { fatalError("Could not get image context") }

		switch imageOrientation {
		case .right, .left:
			context.scaleBy(x: -scaleRatio, y: scaleRatio)
			context.translateBy(x: -sourceSize.height, y: 0)
		default:
			context.scaleBy(x: scaleRatio, y: -scaleRatio)
			context.translateBy(x: 0, y: -sourceSize.height)
		}

		context.concatenate(transform)
		context.draw(cgImageRef, in: CGRect(x: 0, y: 0, width: sourceSize.width, height: sourceSize.height))
		guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { fatalError("Could not get image from context") }
		UIGraphicsEndImageContext()
		return resizedImage
	}

	public func resizedImageToFit(in size: CGSize, scaleUpIfSmaller: Bool = true) -> UIImage
	{
		guard let cgImageRef = self.cgImage else { fatalError("Not backed by CGImage") }
		let sourceSize = CGSize(width: cgImageRef.width, height: cgImageRef.height)

		let boundingSize: CGSize
		switch imageOrientation {
		case .left, .right, .leftMirrored, .rightMirrored:
			boundingSize = CGSize(width: size.height, height: size.width)
		default:
			boundingSize = size
		}

		let destinationSize: CGSize

		if !scaleUpIfSmaller && (sourceSize.width < boundingSize.width) && (sourceSize.height < boundingSize.height) {
			destinationSize = sourceSize
		} else {
			let widthRatio = boundingSize.width / sourceSize.width
			let heightRatio = boundingSize.height / sourceSize.height

			if widthRatio < heightRatio {
				destinationSize = CGSize(width: boundingSize.width, height: floor(sourceSize.height * widthRatio));
			} else {
				destinationSize = CGSize(width: floor(sourceSize.width * heightRatio), height: boundingSize.height);
			}
		}

		return self.resized(to: destinationSize)
	}
}
