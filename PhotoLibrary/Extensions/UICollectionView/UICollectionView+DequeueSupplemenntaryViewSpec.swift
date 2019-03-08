import Nimble
import Quick
import UIKit
import PhotoLibrary

class UICollectionView_DequeueSupplementaryViewSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+DequeueSupplementaryView") {
			var sut: UICollectionView!
			let kind1 = "KIND1"
			let kind2 = "KIND2"

			beforeEach {
				sut = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
			}

			afterEach {
				sut = nil
			}

			context("when SupplementaryView is registered for kind 1") {
				beforeEach {
					sut.register(UICollectionReusableView.self, forSupplementaryViewOfKind: kind1, withReuseIdentifier: "UICollectionReusableView")
				}

				it("should dequeue supplementary view by its name") {
					expect {
						_ = sut.dequeueSupplementaryView(UICollectionReusableView.self, ofKind: kind1, for: .init())
					}.toNot(throwAssertion())
				}

				it("should not dequeue supplementary view of different kind") {
					expect {
						_ = sut.dequeueSupplementaryView(UICollectionReusableView.self, ofKind: kind2, for: .init())
					}.to(raiseException())
				}
			}

			context("when UICollectionViewReusableView is not registered") {
				it("should throw assertion when dequeuing the cell") {
					expect {
						_ = sut.dequeueSupplementaryView(UICollectionReusableView.self, ofKind: kind1, for: .init())
					}.to(raiseException())
				}
			}
		}
	}
}
