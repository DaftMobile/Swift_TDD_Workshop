import UIKit
import Nimble
import Quick
import Swift_TDD_Workshop

class UITableView_DequeueCellSpec: QuickSpec {

	override func spec() {
		describe("UITableView+DequeueCell") {
			var sut: UITableView!

			beforeEach {
				sut = UITableView(frame: .zero)
			}

			afterEach {
				sut = nil
			}

			context("when the cell is registered") {
				beforeEach {
					sut.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
				}

				it("should dequeue the cell by its' name") {
					expect { _ = sut.dequeueCell(UITableViewCell.self) }.toNot(throwAssertion())
				}

				it("should dequeue the cell by its' name for index path") {
					expect { _ = sut.dequeueCell(UITableViewCell.self, for: .init()) }.toNot(throwAssertion())
				}
			}

			context("when the cell is NOT registered") {
				it("should throw assertion when dequeuing the cell") {
					expect { _ = sut.dequeueCell(UITableViewCell.self) }.to(throwAssertion())
				}
			}
		}
	}
}
