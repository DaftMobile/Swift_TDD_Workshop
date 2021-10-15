// TODO: Task 6
// TODO: Add spec file for PollViewController

import UIKit
import Foundation
import Eureka

enum ValidatorType {
	case Text
	case Comment
	case Email
}

struct ValidationContext {
	let validator: (String?) -> Bool
	let message: String
}

class PollViewController: FormViewController {
	let sections = ["Lecture", "Live Coding", "Workshop", "Pizza"]
	var pollBuilder: PollBuilder = PollBuilder()

	init() {
		super.init(nibName: nil, bundle: nil)
		title = "Feedback"
		tabBarItem = .init(title: "Feedback", image: .init(systemName: "list.bullet.rectangle"), tag: 3)

	}

	required init?(coder aDecoder: NSCoder) { return nil }

	override func viewDidLoad() {
		super.viewDidLoad()

		let validators = [ValidatorType.Text: ValidationContext(validator: validateText, message: "Invalid characters"),
						  ValidatorType.Comment: ValidationContext(validator: validateComment, message: "Your comment is too short"),
						  ValidatorType.Email: ValidationContext(validator: validateEmail, message: "Invalid email format")]

		configureForm(sections, validators: validators, pollBuilder: pollBuilder)

	}

	override func viewWillAppear(_ animated: Bool) {
		// TODO: Task 7
		// TODO: Write test that checks whether `rightBarButtonItem` is being set correctly depending on `pollAlreadySent` flag.
		// Then, think what else could be tested for this class.
		self.navigationItem.rightBarButtonItem =
			PollManager.sharedInstance.pollAlreadySent
			? nil
			: UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(didTapSend))

	}

	@objc func didTapSend() {
		guard pollBuilder.isValid() else {
			showInvalidPollAlert()
			return
		}

		let sendAction = UIAlertAction(title: "Yes", style: .default) {
			[weak self] _ in
			self?.sendPoll()
		}

		let alert = UIAlertController(title: "Confirmation", message: "You can send it only once.\nDo you want to continue?", preferredStyle: .alert)

		alert.addAction(sendAction)
		alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
		alert.preferredAction = sendAction

		self.present(alert, animated: true, completion: nil)
	}

	func sendPoll() {
		let poll = self.pollBuilder.poll()
		PollManager.sharedInstance.send(poll: poll) {
			[weak self] success in
			if success {
				self?.navigationItem.setRightBarButton(nil, animated: true)
			}
		}
	}

	func showInvalidPollAlert() {
		let alert = UIAlertController(title: "Error", message: "Can't send poll.\nFields with * are required.", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	// MARK: Validation

	func validateComment(comment: String?) -> Bool {
		guard let comment = comment, !comment.isEmpty else {
			return false
		}
		return comment.count > 10
	}

	func validateEmail(email: String?) -> Bool {
		guard let email = email, !email.isEmpty else {
			return false
		}
		let pattern = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
		let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
		return regex.evaluate(with: email)
	}

	func validateText(text: String?) -> Bool {
		guard let text = text, !text.isEmpty else {
			return false
		}
		return [
			NSCharacterSet.illegalCharacters,
			NSCharacterSet.symbols,
			NSCharacterSet.punctuationCharacters,
			NSCharacterSet.nonBaseCharacters,
			NSCharacterSet.controlCharacters,
			].reduce(true) {
				$0 || text.rangeOfCharacter(from: $1) != nil
		}
	}
}
