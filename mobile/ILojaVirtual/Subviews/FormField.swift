//
//  FormField.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import SwiftUI

struct FormField: View {
    
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure: Bool = false
    var validadeState: ValidateState
    
    
    var body: some View {
        
        let shadowColor: Color = {
            switch validadeState {
            case .valid:
                return .green
            case .invalid:
                return .red
            case .empty:
                return .gray.opacity(0.4)
            }
        }()
        
        HStack {
            Image(systemName: icon)
                .foregroundColor(shadowColor)
                .padding(4)
            
            Group {
                if isSecure {
                    SecureField(placeholder, text: $value)
                } else {
                    TextField(placeholder, text: $value)
                }
            }
            .font(Font.system(size: 16, design: .monospaced))
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.leading)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(shadowColor, lineWidth: 2).shadow(radius: 1, x: 0, y: 2)
        )
    }
}

#Preview {
    VStack {
        FormField(value: .constant("oi@silvaneimartins.com"), icon: "envelope", placeholder: "Email", validadeState: .invalid)
        
        FormField(value: .constant("password"), icon: "lock", placeholder: "Senha", isSecure: true, validadeState: .valid)
        
        FormField(value: .constant(""), icon: "person", placeholder: "Nome", validadeState: .empty)
    }
    .padding(.horizontal)
}
