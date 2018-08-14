//
//  ViewUtil.swift
//Chat
//
//  Created by Erick Martin on 5/18/17.
//
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import SwiftValidator

class ViewUtil {
    
    class func getTopViewController() -> UIViewController? {
        return UIApplication.shared.delegate?.window??.currentViewController()
    }
    
    class func showAlert(_ style: UIAlertControllerStyle = .alert,
                         actions: [UIAlertAction],
                         title: String? = nil,
                         message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        getTopViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    class func showConnectionProblemAlert() {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(.alert , actions: [action], title: "Connection Lost", message: "You are not connected to the internet. Please verify your data connection and try again.")
    }

    class func showAlert(_ message: String, title: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        guard !message.isEmpty else { return }
        
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        showAlert(.alert , actions: [action], title: title, message: message)
    }
    
    class func getValidationErrorMessage(errors: [(Validatable, ValidationError)]) -> String {
        var errorMessages = [String]()
        errors.forEach { error in
            errorMessages.append(error.1.errorMessage)
        }
        
        return errorMessages.joined(separator: "\n")
    }
}
