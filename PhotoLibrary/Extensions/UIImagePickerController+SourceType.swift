import UIKit

extension UIImagePickerController.SourceType {
	var description: String {
		switch self {
		case .camera: return "Camera"
		case .photoLibrary: return "Photo library"
		case .savedPhotosAlbum: return "Saved photos"
		}
	}
}
