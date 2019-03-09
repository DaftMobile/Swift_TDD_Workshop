import Foundation
@testable import Swift_TDD_Workshop

class PhotoDownloaderFake: PhotoDownloader {
	var capturedCompletion: (([PhotoItem]) -> Void)? = nil
	var downloadItemsCalled: Bool = false

	func download(_ completion: @escaping ([PhotoItem]) -> Void) {
		capturedCompletion = completion
		downloadItemsCalled = true
	}
}
