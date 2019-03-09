import UIKit
@testable import Swift_TDD_Workshop

class SourceTypeAvailabilityFake: SourceTypeAvailability {
	var availableSources: [UIImagePickerController.SourceType] = []
}
