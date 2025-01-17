//
//  NavigationTestView.swift
//  TabsApp
//
//  Created by rene on 14/01/25.
//

import SwiftUI

struct NavigationTestView: View {
    var body: some View {
        
        NavigationView{
            
            NavigationLink( destination: NoticiaIndividualView() ){
                
                Text("Oprimeme") //el objeto cliqueable
                
            }
            
        }
    }
}

struct NavigationTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTestView()
    }
}
