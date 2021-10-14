import Quick
import Nimble
import UIKit
@testable import Swift_TDD_Workshop

class PhotoLibraryViewControllerSpec: QuickSpec {
	override func spec() {
		describe("PhotoStreamViewController") {
			var sut: PhotoLibraryViewController!

			var downloader: PhotoDownloaderFake!
			var uploader: PhotoItemUploaderFake!
			var creator: PhotoItemCreatorFake!
			var imageManipulator: ImageManipulatorFake!
			var presenter: ViewControllerPresenterFake!

			beforeEach {
				downloader = PhotoDownloaderFake()
				uploader = PhotoItemUploaderFake()
				creator = PhotoItemCreatorFake()
				imageManipulator = ImageManipulatorFake()
				presenter = ViewControllerPresenterFake()

				sut = PhotoLibraryViewController()

				sut.downloader = downloader
				sut.uploader = uploader
				sut.creator = creator
				sut.imageManipulator = imageManipulator
				sut.presenter = presenter
			}

			describe("when view loads") {
				beforeEach {
					sut.viewDidLoad()
				}
				it("should download stream items") {
					expect(downloader.downloadItemsCalled) == true
				}
				describe("when download finishes") {
					var collectionViewFake: UICollectionViewFake!

					beforeEach {
						collectionViewFake = UICollectionViewFake(frame: .zero,
								collectionViewLayout: UICollectionViewFlowLayout())

						sut.view = collectionViewFake
					}

					context("and is successful") {
						beforeEach {
							downloader.capturedCompletion?([PhotoItem]())
						}
						it("should reload collection view") {
							expect(collectionViewFake.reloadDataCalled) == true
						}
					}
				}
			}

			describe("right bar button item") {
				var barButtonItem: UIBarButtonItem?
				beforeEach {
					_ = sut.view
					barButtonItem = sut.navigationItem.rightBarButtonItem
				}
				it("should be set") {
					expect(barButtonItem).notTo(beNil())
				}
				describe("when pressed") {
					beforeEach {
						let action = barButtonItem!.action
						sut.perform(action, with: barButtonItem!)
					}
					it("should request item creation") {
						expect(creator.createItemCalled) == true
					}
				}
			}

			describe("ItemCreatingDelegate") {
				context("item was created") {
					var fixtureItem: PhotoItem!
					beforeEach {
						fixtureItem = PhotoItem(imageData: Data(), name: "Photo", id: "id", createdAt: Date())
						sut.creator(creator, didCreateItem: fixtureItem)
					}
					it("should upload item") {
						expect(uploader.uploadItemCalled) == true
					}
					describe("when upload finished") {
						var collectionViewFake : UICollectionViewFake!

						beforeEach {
							collectionViewFake = UICollectionViewFake(frame: .zero,
																	  collectionViewLayout: UICollectionViewFlowLayout())
							sut.view = collectionViewFake
						}
						context("with success") {
							beforeEach {
								uploader.capturedCompletion?(true, nil)
							}
							//TODO: Task 1
							//TODO: add a test which checks if item is present in streamItems
							//TODO: add a test which checks if collection view is reloaded (use collection view fake)
						}
					}
				}
				context("failed to create item") {
					beforeEach {
						sut.creator(creator, failedWithError: NSError(domain:"Foo", code: 123, userInfo: nil))
					}
					it("should present alert controller") {
						expect(presenter.capturedPresentedViewController as? UIAlertController).notTo(beNil())
					}
					it("should present alert controller with title Error") {
						let alertController = presenter.capturedPresentedViewController as! UIAlertController
						expect(alertController.title) == "Error"
					}
					it("should present alert controller with message 'Failed to create stream item!'") {
						let alertController = presenter.capturedPresentedViewController as! UIAlertController
						expect(alertController.message) == "Failed to create stream item!"
					}
				}
			}
		}
	}
}
