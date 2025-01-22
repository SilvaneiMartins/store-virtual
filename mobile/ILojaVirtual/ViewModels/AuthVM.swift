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
    var isValidRegister: Bool = false
    var isValidForgot: Bool = false
      
    var passwordValidStateLogin: ValidateState = .empty
    var passwordValidStateRegister: ValidateState = .empty
    var emailValidStateLogin: ValidateState = .empty
    var emailValidStateRegister: ValidateState = .empty
    var emailValidStateForgot: ValidateState = .empty
    
    var nameValidStateRegister: ValidateState = .empty
    
    var emailLogin = "" {
        didSet {
            emailValidStateLogin = emailLogin.isEmpty ? .empty : (isValidEmail(emailLogin) ? .valid : .invalid)
            updateValidLogin()
        }
    }
    
    var emailRegister = "" {
        didSet {
            emailValidStateRegister = emailRegister.isEmpty ? .empty : (isValidEmail(emailRegister) ? .valid : .invalid)
            updateValidRegister()
        }
    }
    
    var emailForgot = "" {
        didSet {
            emailValidStateForgot = emailForgot.isEmpty ? .empty : (isValidEmail(emailForgot) ? .valid : .invalid)
            updateValidForgot()
        }
    }
    
    var passwordLogin = "" {
        didSet {
            passwordValidStateLogin = passwordLogin.isEmpty ? .empty : (passwordLogin.count <= 4 ? .invalid : .valid)
            updateValidLogin()
        }
    }
    
    var passwordRegister = "" {
        didSet {
            passwordValidStateRegister = passwordRegister.isEmpty ? .empty : (passwordRegister.count <= 4 ? .invalid : .valid)
            updateValidRegister()
        }
    }
    
    var nameRegister = "" {
        didSet {
            nameValidStateRegister = nameRegister.isEmpty ? .empty : (nameRegister.count <= 4 ? .invalid : .valid)
            updateValidRegister()
        }
    }
    
    func updateValidLogin() {
        isValidLogin = emailValidStateLogin == .valid && passwordValidStateLogin == .valid
    }
    
    func updateValidRegister() {
        isValidRegister = emailValidStateRegister == .valid && passwordValidStateRegister == .valid && nameValidStateRegister == .valid
    }
    
    func updateValidForgot() {
        isValidForgot = emailValidStateForgot == .valid
    }
}
