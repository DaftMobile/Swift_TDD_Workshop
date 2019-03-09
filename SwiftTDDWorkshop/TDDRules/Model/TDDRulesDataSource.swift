import Foundation
import UIKit

class TDDRulesDataSource {

	struct Element {
		let name: String
		let color: UIColor
	}

	let rules: [Element]

	init() {
		self.rules = [
			Element(name: "RED", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
			Element(name: "GREEN", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
			Element(name: "REFACTOR", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
		]
	}
}
