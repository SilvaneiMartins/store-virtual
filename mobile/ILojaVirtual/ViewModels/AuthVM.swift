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
    
    var alertTitle = ""
    var alertMessage = ""
    var showAlert: Bool = false
    
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
    
    func register(name: String, email: String, password: String) async throws -> ValidateResponse {
        guard let url = URL(string: "\(baseURL)/register") else {
            return ValidateResponse(message: "URL incorreta")
        }
        
        let registerRequest = RegisterRequest(email: email, password: password, name: name)
        
        let requestBody: Data
        
        do {
            requestBody = try JSONEncoder().encode(registerRequest)
        } catch {
            throw NetworkError.invalidData
        }
        
        do {
            let (authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                alertTitle = "Sucesso!"
                alertMessage = authResponse.message ?? ""
                return ValidateResponse(message: authResponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authResponse.message ?? ""
                showAlert = true
                throw NetworkError.invalidResponse
            }
        } catch {
            alertTitle = "Error"
            alertMessage = "Falha na comunicação de rede"
            showAlert = true
            throw NetworkError.invalidResponse
        }
    }
}
