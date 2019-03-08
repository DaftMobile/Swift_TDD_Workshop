import Foundation
import FirebaseDatabase

extension DatabaseReference {
	func setCodableValue<T>(_ value: T) where T: Encodable {
		self.setValue(try! JSONEncoder().encodeJSON(value))
	}
}
