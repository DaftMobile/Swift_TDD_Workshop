import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

class UICollectionView_RegisterSupplementaryViewSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+RegisterSupplementaryView") {
			var sut: UICollectionView!
			let kind1 = "KIND1"

			beforeEach {
				sut = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
			}

			afterEach {
				sut = nil
			}

			context("when SupplementaryView is registered for kind 1") {
				beforeEach {
					sut.registerSupplementaryView(UICollectionReusableView.self, forKind: kind1)
				}

				it("should dequeue supplementary view by its name") {
					expect {
						_ = sut.dequeueReusableSupplementaryView(ofKind: kind1, withReuseIdentifier: "UICollectionReusableView", for: .init())
					}.toNot(throwAssertion())
				}
			}
		}
	}
}
