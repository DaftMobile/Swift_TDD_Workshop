import Nimble
import Quick
import UIKit
import Swift_TDD_Workshop

class UIView_ReusableSpec: QuickSpec {

	override func spec() {
		describe("UIView+Reusable") {
			it("should return correct reuse identifier for a view which conforms to Reusable") {
				class TestReusableView: UIView, Reusable {}

				expect(TestReusableView.reuseIdentifier) == "TestReusableView"
			}

			it("should return correct reuse identifier for the UITableViewCell subclass") {
				class TestTableCell: UITableViewCell {}

				expect(TestTableCell.reuseIdentifier) == "TestTableCell"
			}

			it("should return correct reuse identifier for the UITableViewHeaderFooterView subclass") {
				class TableHeaderFooterView: UITableViewHeaderFooterView {}

				expect(TableHeaderFooterView.reuseIdentifier) == "TableHeaderFooterView"
			}

			it("should return correct reuse identifier for the UICollectionReusableView subclass") {
				class CollectionReusableView: UICollectionReusableView {}

				expect(CollectionReusableView.reuseIdentifier) == "CollectionReusableView"
			}
		}
	}
}
