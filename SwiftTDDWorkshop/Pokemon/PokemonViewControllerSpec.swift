import Foundation
import Quick
import Nimble
import UIKit
@testable import Swift_TDD_Workshop

class PokemonViewControllerSpec: QuickSpec {
	override func spec() {
		var sut: PokemonViewController!

		beforeEach {
			sut = PokemonViewController()
		}

		afterEach {
			sut = nil
		}

		describe("setup") {
			it("should have an instance of a PokemonProvider") {
				expect(sut.pokemonProvider).notTo(beNil())
			}

			it("should have a title") {
				expect(sut.title).to(equal("Pokemon"))
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
					expect(tabBarItem?.title).to(equal("Pokemon"))
				}

				it("should have an icon") {
					expect(tabBarItem?.image).notTo(beNil())
				}
			}
		}


		describe("view loading") {
			var pokemonProviderFake: PokemonProviderFake!

			beforeEach {
				// Arrange

			}

			// Un-exlude
			xit("should reload pokemon") {
				// Act

				// Assert

			}
		}
	}
}
