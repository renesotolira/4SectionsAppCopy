//
//  TopBarViewModel.swift
//  TabsApp
//
//  Created by rene on 23/01/25.
//

import Foundation

class TopBarViewModel: ObservableObject{
    
    //sirve para cambios en segundo plano cuando son operaciones costosas o tardadas.
    @Published var showMainTopBar: Bool = true
       
       func showTopBar() {
           showMainTopBar = true
       }
       
       func hideTopBar() {
           showMainTopBar = false
       }

}
