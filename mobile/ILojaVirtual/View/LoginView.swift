//
//  Login.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthVM.self) var vm
    
    var body: some View {
        
        @Bindable var vmBindable = vm
        
        NavigationStack {
            VStack(spacing: 8) {
                FormField(value: $vmBindable.emailLogin, icon: "envelope.circle", placeholder: "E-mail", validadeState: vmBindable.emailValidStateLogin)
                
                FormField(value: $vmBindable.passwordLogin, icon: "lock.circle", placeholder: "Senha", isSecure: true, validadeState: vmBindable.passwordValidStateLogin)
                
                Button(action: {
                    print("login")
                }) {
                    Text("Entrar")
                        .buttonTextModifier()
                }
                .disabled(vmBindable.isValidLogin ? false : true)
                
                
                NavigationLink(destination: ForgotPasswordView()) {
                    NavLink(text: "Esqeuceu a senha?", subText: "Recuperar")
                }

            }
            .padding(.horizontal, 20)
            .navigationTitle("Entrar")
            .navigationBarBackButtonHidden(true)
            
            Spacer()
            
            NavigationLink(destination: RegisterView()) {
                NavLink(text: "Não tem conta?", subText: "Criar")
            }
        }
    }
}

#Preview {
    LoginView()
}
