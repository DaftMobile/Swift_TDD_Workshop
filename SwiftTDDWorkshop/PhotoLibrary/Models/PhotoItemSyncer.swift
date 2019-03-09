import Foundation

protocol PhotoItemSyncer {
	func sync(_ handler: @escaping ([PhotoItem]) -> Void) -> UInt
	func invalidate(token: UInt)
}

