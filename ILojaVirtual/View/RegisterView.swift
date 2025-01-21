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
                
            }) {
                Text("Registrar")
            }
            .disabled(vmBindable.isValidRegister ? false: true)
        }
        .padding(.horizontal, 32)
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
    }
}

#Preview {
    RegisterView()
}
