import Foundation

class PhotoItemUploaderImpl: PhotoItemUploader {

	var firebaseAdapter: FirebaseAdapting

	init(firebaseAdapter: FirebaseAdapting) {
		self.firebaseAdapter = firebaseAdapter
	}

	func upload(photo: PhotoItem, completion: (Bool, Error?) -> Void) {
		firebaseAdapter.photosDatabase().child(photo.id).setCodableValue(photo)
		completion(true, nil)
	}
}
