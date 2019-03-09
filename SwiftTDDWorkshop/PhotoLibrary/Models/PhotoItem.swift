import Foundation
import UIKit

struct PhotoItem: Codable, Equatable {
	let imageData: Data
	let id: String
	let createdAt: Date
	let name: String

	init(imageData: Data, name: String, id: String, createdAt: Date) {
		self.imageData = imageData
		self.name = name
		self.id = id
		self.createdAt = createdAt
	}

	func makeImage() -> UIImage {
		return UIImage(data: imageData)!
	}
}
