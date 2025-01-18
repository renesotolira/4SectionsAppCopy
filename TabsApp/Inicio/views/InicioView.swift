//
//  InicioView.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import SwiftUI

struct InicioView: View {
    var body: some View {
        NavigationView{
        
            NavigationLink(destination: NoticiaIndividualView()){
                Text(  "Lista de noticias" )
            }
        }
    }
}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}
