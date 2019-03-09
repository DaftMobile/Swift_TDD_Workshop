import Foundation

protocol PhotoItemUploader {
	func upload(photo: PhotoItem, completion: (Bool, Error?) -> Void)
}
