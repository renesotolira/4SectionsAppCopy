//
//  NavigationBarDesign.swift
//  TabsApp
//
//  Created by rene on 28/01/25.
//

import Foundation
import SwiftUI

func setupNavigationBarAppearance() {
   
   let appearance = UINavigationBarAppearance()
   
       appearance.configureWithOpaqueBackground() // Fondo opaco
       appearance.backgroundColor = UIColor(named: "background") // Fondo rojo
       appearance.titleTextAttributes = [
           .foregroundColor: UIColor.black // Color del texto del título

       ]
       appearance.largeTitleTextAttributes = [
            
           .foregroundColor: UIColor.black, // Color del texto de títulos grandes
        
       ]

    
    
       // Aplica la apariencia para todos los estados
       UINavigationBar.appearance().standardAppearance = appearance
       UINavigationBar.appearance().compactAppearance = appearance
   //si causa problema entonces en la 15 up
       UINavigationBar.appearance().scrollEdgeAppearance = appearance
    
  
}
