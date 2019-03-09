import Quick
import Nimble
@testable import Swift_TDD_Workshop

class TDDRulesDataSourceSpec: QuickSpec {
	override func spec() {
		describe("TDDRulesDataSource") {
			var sut: TDDRulesDataSource!

			beforeEach {
				sut = TDDRulesDataSource()
			}

			afterEach {
				sut = nil
			}

			it("should have three stages") {
				expect(sut.rules).to(haveCount(3))
			}

			it("should start red") {
				expect(sut.rules[0].name).to(equal("RED"))
			}

			it("should continue with green") {
				expect(sut.rules[1].name).to(equal("GREEN"))
			}

			it("should finish with refactor") {
				expect(sut.rules[2].name).to(equal("REFACTOR"))
			}
		}
	}
}
