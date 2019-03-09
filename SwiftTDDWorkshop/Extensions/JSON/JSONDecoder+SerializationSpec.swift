import Quick
import Nimble
@testable import Swift_TDD_Workshop

class JSONDecoder_SerializationSpec: QuickSpec {

	struct Example: Decodable {
		let name: String
	}

	override func spec() {
		describe("Encode JSON") {

			var sut: JSONDecoder!

			beforeEach {
				sut = JSONDecoder()
			}
			
			afterEach {
				sut = nil
			}

			context("when decoding simple value") {
				var decoded: Example!

				beforeEach {
					decoded = try? sut.decodeJSON(Example.self, from: ["name": "Marcin"])
				}

				afterEach {
					decoded = nil
				}

				it("should correctly dencode the value") {
					expect(decoded).notTo(beNil())
				}

				it("should have correct name") {
					expect(decoded.name).to(equal("Marcin"))
				}
			}
		}
	}
}
