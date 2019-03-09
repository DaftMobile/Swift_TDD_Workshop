import Foundation
import Quick
import Nimble

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
