import UIKit
import Nimble
import Quick
import PhotoLibrary

class UITableView_RegisterHeaderFooterSpec: QuickSpec {

	override func spec() {
		describe("UITableView+RegisterHeaderFooter") {
			var sut: UITableView!

			beforeEach {
				sut = UITableView(frame: .zero, style: .plain)
			}

			afterEach {
				sut = nil
			}

			context("when register UITableViewHeaderFooterView") {
				beforeEach {
					sut.registerHeaderFooter(UITableViewHeaderFooterView.self)
				}

				it("should dequeue header footer view") {
					expect(sut.dequeueReusableHeaderFooterView(withIdentifier: "UITableViewHeaderFooterView")).toNot(beNil())
				}
			}

			context("when there is no registration for UITableViewHeaderFooterView") {
				it("should NOT dequeue header footer view") {
					expect(sut.dequeueReusableCell(withIdentifier: "UITableViewHeaderFooterView")).to(beNil())
				}
			}
		}
	}
}
