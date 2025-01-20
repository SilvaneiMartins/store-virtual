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
            }
        }
    }
}

#Preview {
    LoginView()
}
