import UIKit
import Nimble
import Quick
import PhotoLibrary

class UITableView_RegisterCellSpec: QuickSpec {

	override func spec() {
		describe("UITableView+RegisterCell") {
			var sut: UITableView!

			beforeEach {
				sut = UITableView(frame: .zero, style: .plain)
			}

			afterEach {
				sut = nil
			}

			context("when register UITableViewCell") {
				beforeEach {
					sut.registerCell(UITableViewCell.self)
				}

				it("should dequeue cell") {
					expect(sut.dequeueReusableCell(withIdentifier: "UITableViewCell")).toNot(beNil())
				}
			}

			context("when not register UITableViewCell") {
				it("should NOT dequeue cell") {
					expect(sut.dequeueReusableCell(withIdentifier: "UITableViewCell")).to(beNil())
				}
			}
		}
	}
}
