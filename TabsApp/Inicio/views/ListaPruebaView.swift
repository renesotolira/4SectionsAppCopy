//
//  ListaPruebaView.swift
//  TabsApp
//
//  Created by rene on 21/01/25.
//

import SwiftUI

struct ListaPruebaView: View {
    var noticiasList : [NoticiaModel] = NoticiaFeedViewModel().getData()
    
    var body: some View {
        NavigationView{
           
            //Text("Listado")
            List(noticiasList, id: \.self.uuid ){ noticiaIndex in
                //vista a repetir
                VStack{
                  // NoticiaFeedView(noticia: noticiaIndex)
                    Text("\(noticiaIndex.uuid)")
                }
            }
        }
    }
}

struct ListaPruebaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaPruebaView()
    }
}
