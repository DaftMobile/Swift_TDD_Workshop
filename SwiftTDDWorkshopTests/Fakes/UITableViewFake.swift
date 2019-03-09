import UIKit

class UITableViewFake: UITableView {
    var reloadDataCalled = false

    override func reloadData() {
        reloadDataCalled = true
    }
}
