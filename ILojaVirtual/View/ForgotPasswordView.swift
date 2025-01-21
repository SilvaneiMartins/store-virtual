//
//  ForgotPasswordView.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 21/01/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Recuperar senha.")
        }
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
    }
}

#Preview {
    ForgotPasswordView()
}
