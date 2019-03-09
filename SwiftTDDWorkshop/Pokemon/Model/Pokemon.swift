import Foundation
import UIKit

struct Pokemon: Decodable {
	let name: String
	let color: Int

	var uiColor: UIColor {
		return UIColor(hex: color)
	}
}
