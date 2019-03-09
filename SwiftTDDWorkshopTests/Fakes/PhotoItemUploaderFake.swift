import Foundation
@testable import Swift_TDD_Workshop

class PhotoItemUploaderFake: PhotoItemUploader {

	var uploadItemCalled = false
	var capturedCompletion: ((Bool, Error?) -> Void)? = nil

	func upload(photo: PhotoItem, completion: @escaping (Bool, Error?) -> Void) {
		uploadItemCalled = true
		capturedCompletion = completion
	}
}
