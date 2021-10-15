import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

class UICollectionView_DequeueSupplementaryViewSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+DequeueSupplementaryView") {
			var sut: UICollectionView!
			let kind1 = "KIND1"

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
			}
		}
	}
}
