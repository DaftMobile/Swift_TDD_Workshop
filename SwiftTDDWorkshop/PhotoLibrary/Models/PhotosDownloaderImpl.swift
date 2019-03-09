import Foundation
import FirebaseDatabase

class PhotoDownloaderImpl: PhotoDownloader {
	let firebaseAdapter: FirebaseAdapting

	init(firebasebaseAdapter: FirebaseAdapting) {
		self.firebaseAdapter = firebasebaseAdapter
	}

	func download(_ handler: @escaping ([PhotoItem]) -> Void) {
		firebaseAdapter.photosDatabase().observeSingleEvent(of: .value) { snapshot in
			let photos = snapshot.children.compactMap { child -> PhotoItem? in
				guard let data = child as? DataSnapshot else { return nil }
				return data.makeObject()
			}
			handler(photos)
		}
	}
}
