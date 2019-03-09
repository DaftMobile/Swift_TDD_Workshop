import Foundation
import UIKit

@testable import Swift_TDD_Workshop

class ImagePickerFactoryFake: ImagePickerFactory {

    var capturedSourceType: UIImagePickerController.SourceType?
    var fakePicker: UIImagePickerController = UIImagePickerController()

    func createPicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        capturedSourceType = sourceType
        return fakePicker
    }

}
