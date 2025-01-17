//
//  ContentView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        TabView{
            
            NoticiaIndividualView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Inicio")
                }
            
            ConveniosView()
                .tabItem {
                    Image(systemName: "car")
                    Text("Convenios")
                }
            
            Text("Pantalla de Configuraciones")
                .tabItem {
                    Image(systemName: "3.square.fill").background(Color.red)
                    Text("Convenios").background(Color.red)
                }
            
        }
        .foregroundColor(.red)
        .accentColor(Color.green)
        .padding(.bottom , 8)
        //.background(Color.green)
        //.cornerRadius(25)
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
