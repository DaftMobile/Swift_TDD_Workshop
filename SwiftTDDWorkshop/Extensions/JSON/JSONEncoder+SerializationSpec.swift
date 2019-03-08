import Quick
import Nimble
@testable import PhotoLibrary

class JSONEncoder_SerializationSpec: QuickSpec {

	struct Example: Encodable {
		let name: String
	}

	override func spec() {
		describe("Encode JSON") {

			var sut: JSONEncoder!

			beforeEach {
				sut = JSONEncoder()
			}
			
			afterEach {
				sut = nil
			}

			context("when encoding simple value") {
				var encoded: Any!

				beforeEach {
					encoded = try? sut.encodeJSON(Example(name: "Sample"))
				}

				afterEach {
					encoded = nil
				}

				it("should correctly encode the value") {
					expect(encoded).notTo(beNil())
				}

				it("should return a dictionary") {
					expect(encoded).to(beAKindOf([String: Any].self))
				}

				it("should have correct count") {
					expect(encoded as? [String: Any]).to(haveCount(1))
				}

				it("should have correct name") {
					expect((encoded as? [String: Any])?["name"] as? String).to(equal("Sample"))
				}
			}
		}
	}
}
