//
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

import Foundation
import UIKit

protocol AlertActionFactory {
	func createAction(title: String, style: UIAlertAction.Style, handler: @escaping (UIAlertAction) -> ()) -> UIAlertAction
}

class DefaultAlertActionFactory: AlertActionFactory {
	func createAction(title: String, style: UIAlertAction.Style, handler: @escaping  (UIAlertAction) -> ()) -> UIAlertAction {
		return UIAlertAction(title: title, style: style, handler: handler)
	}
}
