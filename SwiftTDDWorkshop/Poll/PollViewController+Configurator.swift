import Foundation
import UIKit
import Eureka

typealias Emoji = String
let 🎉 = "🎉", 👍🏻 = "👍🏻", 😎 = "😎", 👎🏻 = "👎🏻", 😡 = "😡"
let symbols = [
	"🎉": 5,
	"👍🏻": 4,
	"😎": 3,
	"👎🏻": 2,
	"😡": 1
]

extension PollViewController {

	// MARK: Form configuration

	func configureForm(_ sections: [String], validators: [ValidatorType:ValidationContext], pollBuilder: PollBuilder) {
		configureGeneralSection(validators, pollBuilder: pollBuilder)
		configureAgendaSections(sections, validators: validators, pollBuilder: pollBuilder)
	}

	func configureGeneralSection(_ validators: [ValidatorType:ValidationContext], pollBuilder: PollBuilder) {
		form +++ Section("General")
			<<<
			NameRow("name") {
				$0.title = "Name*"
				$0.placeholder = "John Smith?"
				}
				.onRowValidationChanged {
					[weak self] (cell, row) in
					guard let context = validators[.Text] else {
						return
					}
					if context.validator(row.value) {
						_ = pollBuilder.setName(name: row.value)
					} else {
						self?.showInvalidValueAlert(context.message)
					}
			}
			<<<
			EmailRow("username") {
				$0.title = "E-mail*"
				$0.placeholder = "you@example.com"
				$0.validationOptions = [.validatesOnChange]
				}
				.onCellHighlightChanged() {
					[weak self] (cell, row) in

					guard let context = validators[.Email] else {
						return
					}
					if context.validator(row.value) {
						_ = pollBuilder.setEmail(email: row.value)
					}

			}
			<<<
			TextAreaRow("feedback") {
				$0.title = "General feedback"
				$0.placeholder = "Write general feedback..."
				}								
				.onRowValidationChanged {
					[weak self] (cell, row) in
					guard let context = validators[.Comment] else {
						return
					}
					if context.validator(row.value) {
						_ = pollBuilder.setComments(comments: row.value)
					} else {
						self?.showInvalidValueAlert(context.message)
					}
		}
	}

	func configureAgendaSections(_ sections: [String], validators: [ValidatorType:ValidationContext], pollBuilder: PollBuilder) {
		for (i, section) in sections.enumerated() {
			form +++ Section(section)
				<<<
				SegmentedRow<Emoji>("rate\(i)") {
					$0.title = "What's your rate?"
					$0.options = [🎉, 👍🏻, 😎, 👎🏻, 😡]
					$0.value = 🎉
					pollBuilder.setRate(rate: symbols[🎉], forTitle: section)
					}
					.onChange {
						row in
						guard let value = row.value else {
							return
						}
						_ = pollBuilder.setRate(rate: symbols[value], forTitle: section)
				}
				<<<
				TextAreaRow("comment\(i)") {
					$0.title = "Comments"
					$0.placeholder = "Write your comments here..."
					}
					.onRowValidationChanged {
						[weak self] (cell, row) in
						guard let context = validators[.Comment] else {
							return
						}
						if context.validator(row.value) {
							_ = pollBuilder.setComment(comment: row.value, forTitle: section)
						} else {
							self?.showInvalidValueAlert(context.message)
						}
			}
		}
	}

	func showInvalidValueAlert(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

}
