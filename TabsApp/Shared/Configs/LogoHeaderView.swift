//
//  LogoHeaderView.swift
//  TabsApp
//
//  Created by rene on 28/01/25.
//

import SwiftUI

///Esta vista imprime el logo para la cabecera con tamaño no ajustable de 36x36
struct LogoHeaderView: View {
    var body: some View {
        Image(Images.toolbarLogo)
            .resizable()
            //.frame(width: 220 , height: 50)
            .scaledToFit()
            .offset(y: -5)
    }
}

struct LogoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogoHeaderView()
                .preferredColorScheme(.dark)
        }
    }
}
