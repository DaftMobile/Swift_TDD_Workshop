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

		it("should have a tab bar item") {
			expect(sut.tabBarItem).notTo(beNil())
		}

		describe("tab bar item") {
			var tabBarItem: UITabBarItem?

			beforeEach {
				tabBarItem = sut.tabBarItem
			}

			afterEach {
				tabBarItem = nil
			}

			it("should have correct title") {
				expect(tabBarItem?.title).to(equal("Rules"))
			}

			it("should have an icon") {
				expect(tabBarItem?.image).notTo(beNil())
			}
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

				// TASK 1: Check if the layout is correct type. Add appropriate tests.

			}
		}
	}
}
