import Foundation

protocol PhotoItemUploader {
	func upload(photo: PhotoItem, completion: @escaping (Bool, Error?) -> Void)
}
