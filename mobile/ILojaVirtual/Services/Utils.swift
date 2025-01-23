//
//  Utils.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import Foundation
import SwiftUICore
import SwiftUI

enum ValidateState {
    case valid
    case invalid
    case empty
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
    let emailTest = email.range(of: emailRegex, options: [.regularExpression, .caseInsensitive]) != nil
    return emailTest
}

extension View {
    public func buttonTextModifier() -> some View {
        self.modifier(ButtonTextModifier())
    }
    
    func backButtonModifier(dismiss: DismissAction) -> some View {
        self.modifier(BackButtonModifier(dismiss: dismiss))
    }
 }

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .heavy))
            .background(Color.black)
            .cornerRadius(10)
    }
}

struct BackButtonModifier: ViewModifier {
    var dismiss: DismissAction
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .tint(Color.primary)
                    }
                }
            }
    }
}

let baseURL = "http://192.168.0.94:4000"
