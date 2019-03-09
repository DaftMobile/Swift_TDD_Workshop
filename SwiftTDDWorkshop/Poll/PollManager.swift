import Foundation

class PollManager {
	static let sharedInstance = PollManager()

	private(set) var pollAlreadySent: Bool = false

	func send(poll: Poll, completion: ((Bool) -> ())?) {
		DefaultFirebaseAdapter().pollsDatabase().childByAutoId().setCodableValue(poll)
	}
}

struct Poll: Codable {
	let name: String?
	let email: String?
	let comments: String?
	let items: [Item]?

	struct Item: Codable {
		var title: String?
		var rate: Int?
		var comment: String?
	}

	func isValid() -> Bool {
		return (try? JSONEncoder().encode(self)) != nil
	}
}

class PollBuilder {
	private var name: String?
	private var email: String?
	private var comments: String?
	private var items: [String:Poll.Item] = [:]

	func isValid() -> Bool {
		return self.poll().isValid()
	}

	func poll() -> Poll {
		return Poll(name: name, email: email, comments: comments, items: items.values.compactMap({ $0 }))
	}

	// MARK: Poll building

	func setName(name: String?) -> PollBuilder {
		self.name = name
		return self
	}

	func setEmail(email: String?) -> PollBuilder {
		self.email = email
		return self
	}

	func setComments(comments: String?) -> PollBuilder {
		self.comments = comments
		return self
	}

	func setRate(rate: Int?, forTitle title: String) -> PollBuilder {
		if var item = items[title] {
			item.rate = rate
		} else {
			items[title] = Poll.Item(title: title, rate: rate, comment: nil)
		}
		return self
	}

	func setComment(comment: String?, forTitle title: String) -> PollBuilder {
		if var item = items[title] {
			item.comment = comment
		} else {
			items[title] = Poll.Item(title: title, rate: nil, comment: comment)
		}
		return self
	}
}
