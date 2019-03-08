import Nimble
import Quick
import UIKit
import PhotoLibrary

class UICollectionView_DequeueCellSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+DequeueCell") {
			var sut: UICollectionView!

			beforeEach {
				sut = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
			}

			afterEach {
				sut = nil
			}

			context("when the cell is registered") {
				beforeEach {
					sut.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
				}

				it("should dequeue the cell by its' name for index path") {
					expect { _ = sut.dequeueCell(UICollectionViewCell.self, for: .init()) }.toNot(throwAssertion())
				}
			}

			context("when the cell is NOT registered") {
				it("should raise exception when dequeuing the cell") {
					expect { _ = sut.dequeueCell(UICollectionViewCell.self, for: .init()) }.to(raiseException())
				}
			}
		}
	}
}
