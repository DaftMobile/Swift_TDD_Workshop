import Quick
import Nimble

@testable import Swift_TDD_Workshop

class PhotoItemCreatorSpec: QuickSpec {
	override func spec() {
		describe("PhotoItemCreator") {

			var sut: PhotoItemCreatorImpl!

			var testDelegate: TestPhotoItemCreatorDelegate!

			var presenter: ViewControllerPresenterFake!
			var resourceAvailability: SourceTypeAvailabilityFake!
			var alertActionFactory: AlertActionFactoryFake!
			var pickerFactory: ImagePickerFactoryFake!
			var imageManipulator: ImageManipulatorFake!

			beforeEach {
				presenter = ViewControllerPresenterFake()
				resourceAvailability = SourceTypeAvailabilityFake()
				alertActionFactory = AlertActionFactoryFake()
				pickerFactory = ImagePickerFactoryFake()
				imageManipulator = ImageManipulatorFake()

				sut = PhotoItemCreatorImpl(presenter: presenter)
				sut.resourceAvailability = resourceAvailability
				sut.actionFactory = alertActionFactory
				sut.pickerFactory = pickerFactory
				sut.imageManipulator = imageManipulator

				testDelegate = TestPhotoItemCreatorDelegate()
				sut.delegate = testDelegate
			}

			describe("create item") {

				//TODO: Task 2
				/*
				context("when no source is available") {
				beforeEach {
				resourceAvailability.availableSources = []
				}
				}

				context("when photo library is only available") {
				beforeEach {
				resourceAvailability.availableSources = [.photoLibrary]
				}
				}

				context("when camera is only available") {
				beforeEach {
				resourceAvailability.availableSources = [.camera]
				}
				}
				*/

				context("when photo library and camera are available") {
					beforeEach {
						resourceAvailability.availableSources = [.photoLibrary, .camera]
						sut.createPhotoItem()
					}
					it("should present alert controller") {
						expect(presenter.capturedPresentedViewController as? UIAlertController).notTo(beNil())
					}
					it("should present alert controller with action sheet style") {
						let alertController = presenter.capturedPresentedViewController as! UIAlertController
						expect(alertController.preferredStyle).to(equal(.actionSheet))
					}
					it("should present alert controller with title 'Add new Photo to the stream'") {
						let alertController = presenter.capturedPresentedViewController as! UIAlertController
						expect(alertController.title).to(equal("Add new Photo to the stream"))
					}
					it("should have 3 alert actions") {
						expect(alertActionFactory.capturedActions).to(haveCount(3))
					}
					it("should present alert controller with 1st option 'Photo library'") {
						let alertAction = alertActionFactory.capturedActions[0]
						expect(alertAction.title) == "Photo library"
					}
					it("should present alert controller with 1st option set to Default style") {
						let alertAction = alertActionFactory.capturedActions[0]
						expect(alertAction.style).to(equal(.default))
					}
					it("should present alert controller with 2nd option 'Camera'") {
						let alertAction = alertActionFactory.capturedActions[1]
						expect(alertAction.title).to(equal("Camera"))
					}
					it("should present alert controller with 2nd option set to Default style") {
						let alertAction = alertActionFactory.capturedActions[1]
						expect(alertAction.style).to(equal(.default))
					}
					it("should present alert controller with 3rd option 'Cancel'") {
						let alertAction = alertActionFactory.capturedActions[2]
						expect(alertAction.title).to(equal("Cancel"))
					}
					it("should present alert controller with 3rd option set to Cancel style") {
						let alertAction = alertActionFactory.capturedActions[2]
						expect(alertAction.style).to(equal(.cancel))
					}

					context("when user selects") {
						beforeEach {
							presenter.capturedPresentedViewController = nil
						}
						context("first option") {
							beforeEach {
								let action = alertActionFactory.capturedActions[0]
								let handler = alertActionFactory.capturedHandlers[0]
								handler(action)
							}
							it("should present image picker") {
								expect(presenter.capturedPresentedViewController as? UIImagePickerController).notTo(beNil())
							}
							it("should present picker with Photo Library source type") {
								expect(pickerFactory.capturedSourceType!).to(equal(.photoLibrary))
							}
						}
						context("second option") {
							beforeEach {
								let action = alertActionFactory.capturedActions[1]
								let handler = alertActionFactory.capturedHandlers[1]
								handler(action)
							}
							it("should present image picker") {
								expect(presenter.capturedPresentedViewController as? UIImagePickerController).notTo(beNil())
							}
							it("should present picker with Camera source type") {
								expect(pickerFactory.capturedSourceType!).to(equal(.camera))
							}
						}
						context("third option") {
							beforeEach {
								let action = alertActionFactory.capturedActions[2]
								let handler = alertActionFactory.capturedHandlers[2]
								handler(action)
							}
							it("should NOT present image picker") {
								expect(presenter.capturedPresentedViewController as? UIImagePickerController).to(beNil())
							}
						}
					}
				}

				describe("image picker controller delegate") {

					var picker: UIImagePickerController!
					var image: UIImage!

					beforeEach {
						picker = UIImagePickerController()
						image = UIImage()
					}

					context("did pick media") {
						beforeEach {
							sut.imagePickerController(picker,
													  didFinishPickingMediaWithInfo: [UIImagePickerController.InfoKey.originalImage: image])
						}
						//TODO: Task 3
						//TODO: implement functionality which asks user about item title

						it("should scale selected image using Image Manipulator") {
							expect(imageManipulator.capturedImageToScale).notTo(beNil())
							expect(imageManipulator.capturedImageToScale!) == image
						}

						it("should inform delegate about Photo Item creation") {
							expect(testDelegate.capturedItem).notTo(beNil())
						}
					}
					context("did cancel") {
						beforeEach {
							sut.imagePickerControllerDidCancel(picker)
						}
						it("should dismiss image picker") {
							expect(presenter.capturedDismissedViewController as? UIImagePickerController).notTo(beNil())
						}
					}
				}
			}
		}
	}
}
