//
//  ILojaVirtualApp.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import SwiftUI


@main
struct ILojaVirtualApp: App {
    
    @State var vm = AuthVM()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if true {
                    LoginView()
                } else {
                    MainTabView()
                }
            }
            .environment(vm)
        }
    }
}
