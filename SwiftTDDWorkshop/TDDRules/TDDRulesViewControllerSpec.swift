import Quick
import Nimble
import UIKit
@testable import Swift_TDD_Workshop

class TDDRulesViewControllerSpec: QuickSpec {
	override func spec() {

		var sut: TDDRulesViewController!

		beforeEach {
			sut = TDDRulesViewController()
		}

		afterEach {
			sut = nil
		}

		it("should have a correct title") {
			expect(sut.title).to(equal("Rules"))
		}

		describe("collection view") {
			var view: UICollectionView!

			beforeEach {
				view = sut.view as? UICollectionView
			}

			afterEach {
				view = nil
			}

			it("should always bounce vertically") {
				expect(view.alwaysBounceVertical).to(beTruthy())
			}

			describe("layout") {

				var layout: UICollectionViewLayout?

				beforeEach {
					layout = view?.collectionViewLayout
				}

				afterEach {
					layout = nil
				}

				it("should be a kind of tdd rules collection view layout") {
					expect(layout).to(beAKindOf(TDDRulesCollectionViewLayout.self))
				}
			}
		}
	}
}
