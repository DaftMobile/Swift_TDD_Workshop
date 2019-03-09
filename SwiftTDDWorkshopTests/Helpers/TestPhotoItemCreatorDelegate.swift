import Foundation
@testable import Swift_TDD_Workshop

class TestPhotoItemCreatorDelegate: PhotoItemCreatorDelegate {

	var capturedItem: PhotoItem?
	var capturedError: Error?

	func creator(_ creator: PhotoItemCreator, didCreateItem item: PhotoItem) {
		capturedItem = item
	}

	func creator(_ creator: PhotoItemCreator, failedWithError error: Error) {
		capturedError = error
	}
}
