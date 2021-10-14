import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

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
		}
	}
}
