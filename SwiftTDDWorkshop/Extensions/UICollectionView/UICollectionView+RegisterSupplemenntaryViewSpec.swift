import Nimble
import Quick
import UIKit
import PhotoLibrary

class UICollectionView_RegisterSupplementaryViewSpec: QuickSpec {

	override func spec() {
		describe("UICollectionView+RegisterSupplementaryView") {
			var sut: UICollectionView!
			let kind1 = "KIND1"
			let kind2 = "KIND2"

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

				it("should not dequeue supplementary view of different kind") {
					expect {
						_ = sut.dequeueReusableSupplementaryView(ofKind: kind2, withReuseIdentifier: "UICollectionReusableView", for: .init())
					}.to(raiseException())
				}
			}

			context("when UICollectionViewReusableView is not registered") {
				it("should throw assertion when dequeuing the cell") {
					expect {
						_ = sut.dequeueReusableSupplementaryView(ofKind: kind1, withReuseIdentifier: "UICollectionReusableView", for: .init())
					}.to(raiseException())
				}
			}
		}
	}
}
