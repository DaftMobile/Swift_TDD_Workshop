import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

class UICollectionView_RegisterCellSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+RegisterCell") {
			var sut: UICollectionView!

			beforeEach {
				sut = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
			}

			afterEach {
				sut = nil
			}

			context("when cell is registered") {
				beforeEach {
					sut.registerCell(UICollectionViewCell.self)
				}

				it("should dequeue the cell by its' name") {
					expect {
						_ = sut.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: .init())
					}.toNot(throwAssertion())
				}
			}
		}
	}
}
