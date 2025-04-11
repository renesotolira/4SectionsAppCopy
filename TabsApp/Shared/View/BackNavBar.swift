//
//  BackNavBar.swift
//  TabsApp
//
//  Created by rene on 08/04/25.
//

import SwiftUI

struct BackNavBar: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String = ""
        
    var body: some View {
        ///
        HStack( alignment: .center, spacing: 16){
            Button(action: {
                print("en regresar")
                presentationMode.wrappedValue.dismiss()
            }){
                
                Image(systemName:"chevron.backward")
               
                      
                Text(title)
                
            }//.foregroundColor(.blue)
        }
        ///
    }
}

struct BackNavBar_Previews: PreviewProvider {
    static var previews: some View {
        BackNavBar()
    }
}
