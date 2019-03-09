import Foundation
@testable import Swift_TDD_Workshop

class PhotoItemCreatorFake: PhotoItemCreator {
	weak var delegate: PhotoItemCreatorDelegate?
	var createItemCalled = false

	func createPhotoItem() {
		createItemCalled = true
	}
}
