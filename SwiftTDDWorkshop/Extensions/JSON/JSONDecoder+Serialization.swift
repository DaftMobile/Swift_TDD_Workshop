import Foundation

extension JSONDecoder {
	func decodeJSON<T>(_ type: T.Type, from JSON: Any) throws -> T where T : Decodable {
		return try self.decode(T.self, from: JSONSerialization.data(withJSONObject: JSON))
	}
}
