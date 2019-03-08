import Foundation
import FirebaseDatabase

extension DataSnapshot {
	func makeObject<T>() -> T? where T: Decodable {
		guard let json = self.value else { return nil }
		return try? JSONDecoder().decodeJSON(T.self, from: json)
	}
}
