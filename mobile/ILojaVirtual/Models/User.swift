//
//  User.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 22/01/25.
//

import Foundation

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let name: String
}

struct ValidateResponse: Decodable {
    let message: String?
}
