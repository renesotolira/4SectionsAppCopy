//
//  HomeView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI

struct NoticiaIndividualView: View {
    //Inicio->noticia inico -> noticia indiivuda
    @Environment(\.presentationMode) var presentationMode
    
    init() {
            
            UITabBar.appearance().isHidden = true
        
            UINavigationBar.appearance().barTintColor =  UIColor(named: "background")
        
        //inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        //large title
            UINavigationBar.appearance().largeTitleTextAttributes =  [.font : UIFont(name: "Arial-BoldMT", size: 24)!, .foregroundColor : UIColor.white]
        }
    
    var body: some View {
        ZStack{
           // Color.blue
            
            VStack(spacing: 0){
                Text("Bienvenido a la mejor app del mundo.")
                   // .foregroundColor(.white)
                
                Text("----- 😊 ------ ")
                    .foregroundColor(Color.purple)
            }
        }
    
        .navigationTitle("Inicio")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  HStack(spacing: 20){ //inicio de HStack
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName:
                        "arrow.backward")
                    .font(.largeTitle)
                    //.font(.system(size: 16, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .offset(y: -5)
            }
            Image("logo")
                .resizable()
                .frame(width: 36 , height: 36)
                .scaledToFill()
                .offset(y: -5)
                
              
                                
        }, trailing: Text("hol").foregroundColor(.white))
        

    }
}

struct NoticiaIndividualView_Previews: PreviewProvider {
    static var previews: some View {
        NoticiaIndividualView()
    }
}
