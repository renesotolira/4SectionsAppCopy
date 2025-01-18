//
//  HomeView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI

struct HogarView: View {
    var body: some View {
        ZStack{
            Color.blue
            
            VStack{
                Text("Bienvenido a la mejor app del mundo.")
                    .foregroundColor(.white)
                
                Text("----- 😊 ------ ")
                    .foregroundColor(Color.purple)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HogarView()
    }
}
