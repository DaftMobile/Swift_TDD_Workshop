import Foundation
import UIKit

protocol ImagePickerFactory {
	func createPicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController
}

class DefaultImagePickerFactory: ImagePickerFactory {
	func createPicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.sourceType = sourceType
		return picker
	}
}
