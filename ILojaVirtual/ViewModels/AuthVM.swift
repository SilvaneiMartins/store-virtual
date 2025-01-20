//
//  AuthVM.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import Foundation

@Observable
class AuthVM {
    var isValidLogin: Bool = false
      
    var passwordValidStateLogin: ValidateState = .empty
    var emailValidStateLogin: ValidateState = .empty
    
    var emailLogin = "" {
        didSet {
            emailValidStateLogin = emailLogin.isEmpty ? .empty : (isValidEmail(emailLogin) ? .valid : .invalid)
            updateValidLogin()
        }
    }
    
    var passwordLogin = "" {
        didSet {
            passwordValidStateLogin = passwordLogin.isEmpty ? .empty : (passwordLogin.count <= 4 ? .invalid : .valid)
            updateValidLogin()
        }
    }
    
    func updateValidLogin() {
        isValidLogin = emailValidStateLogin == .valid && passwordValidStateLogin == .valid
    }
}
