//
//  Utils.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import Foundation

enum ValidateState {
    case valid
    case invalid
    case empty
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2.64}"
    let emailTest = (email.range(of: emailRegex, options: .regularExpression) != nil)
    return emailTest
}
