import FirebaseDatabase

protocol FirebaseAdapting {
	func database(reference: String) -> DatabaseReference
}

extension FirebaseAdapting {
	func photosDatabase() -> DatabaseReference {
		return database(reference: "photot")
	}

	func pollsDatabase() -> DatabaseReference {
		return database(reference: "polls")
	}
}

class DefaultFirebaseAdapter: FirebaseAdapting {
	func database(reference: String) -> DatabaseReference {
		return Database.database().reference(withPath: reference)
	}
}
