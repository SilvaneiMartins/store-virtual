//
//  NavLink.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 20/01/25.
//

import SwiftUI

struct NavLink: View {
    
    var text:String
    var subText: String
    
    var body: some View {
        HStack {
            Text(text)
            
            Text(subText)
                .font(.system(size: 18, weight: .semibold))
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    VStack {
        NavLink(text: "Esqueceu sua", subText: "senha?")
        NavLink(text: "Refefinir", subText: "senha!")
    }
}
