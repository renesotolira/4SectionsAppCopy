//
//  HeaderView.swift
//  TabsApp
//
//  Created by rene on 23/01/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            Rectangle().frame(height: 44).foregroundColor(Color.green)
                .overlay(
                    HStack(){
                        
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        
                        Spacer()
                        
                        Text("Inicio").foregroundColor(.white)
                            .font(.title3)

                        Spacer()
                    }.offset(y: -5)
                )
           // Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
