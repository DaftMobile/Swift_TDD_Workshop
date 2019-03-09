import Foundation
import FirebaseDatabase

class PhotoItemSyncerImpl: PhotoItemSyncer {

	let firebaseAdapter: FirebaseAdapting

	init(firebasebaseAdapter: FirebaseAdapting) {
		self.firebaseAdapter = firebasebaseAdapter
	}

	func sync(_ handler: @escaping ([PhotoItem]) -> Void) -> UInt {
		return firebaseAdapter.photosDatabase().observe(.value) { snapshot in
			let photos = snapshot.children.compactMap { child -> PhotoItem? in
				guard let data = child as? DataSnapshot else { return nil }
				return data.makeObject()
			}
			handler(photos)
		}
	}

	func invalidate(token: UInt) {
		firebaseAdapter.photosDatabase().removeObserver(withHandle: token)
	}
}
