import Foundation
import Quick
import Nimble
@testable import Swift_TDD_Workshop

class PokemonProviderSpec: QuickSpec {
	override func spec() {
		var sut: PokemonProvider!

		beforeEach {
			sut = PokemonProvider()
		}

		afterEach {
			sut = nil
		}

		describe("reloading pokemon") {
			it("should load pokemon") {
				sut.reload { }
				expect(sut.pokemon).toEventually(haveCount(3))
			}

			it("should call completion when done") {
				waitUntil { done in
					sut.reload { done() }
				}
			}
		}
	}
}
