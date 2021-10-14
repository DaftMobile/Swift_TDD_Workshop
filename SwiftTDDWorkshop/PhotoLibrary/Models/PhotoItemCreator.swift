import Foundation
import UIKit

protocol PhotoItemCreatorDelegate: AnyObject {
	func creator(_ creator: PhotoItemCreator, didCreateItem item: PhotoItem)
	func creator(_ creator: PhotoItemCreator, failedWithError error: Error)
}

protocol PhotoItemCreator {
	var delegate: PhotoItemCreatorDelegate? { get set }
	func createPhotoItem()
}

class PhotoItemCreatorImpl: NSObject, PhotoItemCreator, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	weak var delegate: PhotoItemCreatorDelegate?

	var controllerPresenter: ViewControllerPresenter
	var resourceAvailability: SourceTypeAvailability
	var actionFactory: AlertActionFactory
	var pickerFactory: ImagePickerFactory
	var imageManipulator: ImageManipulator

	//MARK: Object Life Cycle

	init(presenter: ViewControllerPresenter) {
		controllerPresenter = presenter
		resourceAvailability = DefaultSourceTypeProvider()
		actionFactory = DefaultAlertActionFactory()
		pickerFactory = DefaultImagePickerFactory()
		imageManipulator = DefaultImageManipulator()
	}

	//MARK: ItemCreating

	func createPhotoItem() {
		//TODO: Task 2
		//TODO: check the available source types from `resourceAvailability`
		//TODO: if it's empty, inform delegate about error
		//TODO: if it contains single element, present `UIImagePickerController`
		//TODO: if it contains more then one element, present `UIAlertController` so user has to pick source
		presentSourcesActionSheet()
	}

	//MARK: UIImagePickerControllerDelegate

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let image = info[.originalImage] as? UIImage {
			let scaledImage = imageManipulator.scale(image: image, maxDimension: 600)
			let imageData = scaledImage.jpegData(compressionQuality: 0.6)!
			let photoItem = PhotoItem.init(imageData: imageData, name: "Title", id: UUID().uuidString, createdAt: Date())

			//TODO: Task 3
			//TODO: Fix issue that all stream items have the same, hardcoded title
			//TODO: Prompt user with an alert with text field, so he can provide title

			delegate?.creator(self, didCreateItem: photoItem)
		} else {
			delegate?.creator(self, failedWithError: NSError(domain: "SwiftTDDWorkshop", code: -1, userInfo: nil))
		}
		controllerPresenter.dismiss(viewController: picker)
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		controllerPresenter.dismiss(viewController: picker)
	}

	//MARK: Private methods

	private func presentSourcesActionSheet() {
		let alertController = UIAlertController(title: "Add new Photo to the stream", message: nil, preferredStyle: .actionSheet)

		resourceAvailability.availableSources.compactMap { [weak self] source in
			guard let `self` = self else { return nil }
			return self.actionFactory.createAction(title: source.description, style: .default, handler: { _ in  self.presentPickerWithResourceType(sourceType: source)})
			}.forEach { action in
				alertController.addAction(action)
		}

		let cancelAction = actionFactory.createAction(title: "Cancel", style: .cancel, handler: { _ in })
		alertController.addAction(cancelAction)
		controllerPresenter.present(viewController: alertController)
	}

	private func presentPickerWithResourceType(sourceType: UIImagePickerController.SourceType) {
		let imagePicker = pickerFactory.createPicker(sourceType: sourceType)
		imagePicker.delegate = self
		controllerPresenter.present(viewController: imagePicker)
	}
}
