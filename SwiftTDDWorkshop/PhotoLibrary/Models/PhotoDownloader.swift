import Foundation

protocol PhotoDownloader {
	func download(_ completion: @escaping ([PhotoItem]) -> Void)
}
