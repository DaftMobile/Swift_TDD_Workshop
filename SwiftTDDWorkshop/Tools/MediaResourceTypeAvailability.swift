import UIKit

protocol SourceTypeAvailability {
	var availableSources: [UIImagePickerController.SourceType] { get }
}

class DefaultSourceTypeProvider: SourceTypeAvailability {
	var availableSources: [UIImagePickerController.SourceType] {
		let types: [UIImagePickerController.SourceType] = [.camera, .photoLibrary]
		return types.filter { type in UIImagePickerController.isSourceTypeAvailable(type) }
	}
}
