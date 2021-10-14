import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

class UITableView_DequeueTableHeaderFooterSpec: QuickSpec {

	override func spec() {
		describe("UITableView+DequeueTableHeaderFooter") {
			var sut: UITableView!

			beforeEach {
				sut = UITableView(frame: .zero)
			}

			afterEach {
				sut = nil
			}

			context("when header is registered") {
				beforeEach {
					sut.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "UITableViewHeaderFooterView")
				}

				it("should dequeue the header footer view") {
					expect { _ = sut.dequeueHeaderFooter(UITableViewHeaderFooterView.self) }.toNot(throwAssertion())
				}
			}

			context("when header is NOT registered") {
				it("should throw assertion when dequeuing header") {
					expect { _ = sut.dequeueHeaderFooter(UITableViewHeaderFooterView.self) }.to(throwAssertion())
				}
			}
		}
	}
}
