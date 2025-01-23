//
//  RegisterView.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 21/01/25.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(AuthVM.self) var vm
    
    var body: some View {
        
        @Bindable var vmBindable = vm
        
        VStack {
            FormField(value: $vmBindable.nameRegister, icon: "person.circle", placeholder: "Nome", validadeState: vmBindable.nameValidStateRegister)
            
            FormField(value: $vmBindable.emailRegister, icon: "envelope.circle", placeholder: "E-mail", validadeState: vmBindable.emailValidStateRegister)
            
            FormField(value: $vmBindable.passwordRegister, icon: "lock.circle", placeholder: "Senha", isSecure: true, validadeState: vmBindable.passwordValidStateRegister)
            
            Button(action: {
                Task {
                    try await vmBindable.register(name: vm.nameRegister, email: vm.emailRegister, password: vm.passwordRegister)
                }
            }) {
                Text("Registrar")
                    .buttonTextModifier()
            }
            .disabled(vmBindable.isValidRegister ? false : true)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
        .alert(vm.alertTitle, isPresented: $vmBindable.showAlert) {
            Button("OK", role: .cancel) {
                
            }
        } message: {
            Text(vmBindable.alertMessage)
        }
        
        Spacer()
        
        NavigationLink(destination: ForgotPasswordView()) {
            NavLink(text: "Esqueceu a senha?", subText: "Recuperar")
        }.navigationTitle("Cadastro")
    }
}

#Preview {
    RegisterView()
}
