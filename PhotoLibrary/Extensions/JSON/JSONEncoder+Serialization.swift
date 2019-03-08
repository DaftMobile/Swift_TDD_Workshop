import Foundation

extension JSONEncoder {
	func encodeJSON<T>(_ value: T) throws -> Any where T : Encodable {
		return try JSONSerialization.jsonObject(with: self.encode(value))
	}
}
