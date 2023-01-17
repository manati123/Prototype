//
//  ErrorHandler.swift
//  InternshipTinder
//
//  Created by Silviu Preoteasa on 16.01.2023.
//

import SwiftUI
import SwiftMessages

class ErrorHandler {
    static let errorHandler = ErrorHandler()
    
    func showError(message: String) {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.warning)

            view.configureDropShadow()

            let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
            view.configureContent(title: "Something went wrong", body: message, iconText: iconText)
            view.button?.isHidden = true
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

            // Reduce the corner radius (applicable to layouts featuring rounded corners).
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10

            SwiftMessages.show(view: view)
        }
}
