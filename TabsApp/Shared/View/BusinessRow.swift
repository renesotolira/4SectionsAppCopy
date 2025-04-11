//
//  BusinessRow.swift
//  TabsApp
//
//  Created by rene on 10/04/25.
//

import SwiftUI

struct BusinessRow: View {
    var id: Int
    var url: String
    var name: String
    
    var body: some View {
        HStack(spacing: 16){
            NavigationLink(destination: NegocioView(id: id))
            {
                ImagesVisualizer(
                    url: url,
                    width: 35 ,
                    height: 35
                )
            
            
                VStack{
                    Text(name)
                    .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }.padding(6)
    }
}

struct BusinessRow_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRow(id: 1, url: "", name: "Pollo Churchs")
    }
}
