//
//  ForgotPasswordView.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 21/01/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(AuthVM.self) var vm
    
    var body: some View {
        
        @Bindable var vmBindable = vm
        
        VStack {
            FormField(value: $vmBindable.emailForgot, icon: "envelope.circle", placeholder: "E-mail", validadeState: vmBindable.emailValidStateForgot)
            
            Button(action: {
                print("Email enviado, recuperar senha")
            }) {
                Text("Solicitar")
                    .buttonTextModifier()
            }
            .disabled(vmBindable.isValidForgot ? false: true)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
        .navigationTitle("Recuperar Senha")
        
        Spacer()
    }
}

#Preview {
    ForgotPasswordView()
}
