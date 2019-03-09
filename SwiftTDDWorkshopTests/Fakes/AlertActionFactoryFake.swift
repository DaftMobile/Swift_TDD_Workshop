import Foundation
import UIKit

@testable import Swift_TDD_Workshop

class AlertActionFactoryFake: AlertActionFactory {

    var capturedHandlers: [((UIAlertAction) -> ())] = []
    var capturedActions: [UIAlertAction] = []

    func createAction(title: String, style: UIAlertAction.Style, handler: @escaping (UIAlertAction) -> ()) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        capturedHandlers.append(handler)
        capturedActions.append(action)
        return action
    }
}
