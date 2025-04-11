//
//  NavegacionView.swift
//  TabsApp
//
//  Created by rene on 23/01/25.
//

import SwiftUI

struct NavegacionView: View {
    
    init() {
           
        setupNavigationBarAppearance()
    }
    
    var body: some View {
        /*VStack{
            NavigationView{
                ZStack{
                    
                  
                    
                    ZStack{  //otra vista
                        //improvisado
                        Color.green.edgesIgnoringSafeArea(.top)
                            
                        Color.blue
                    }  //otra vista
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.red)
            
        
            
        }*/
        
        ZStack{
            
          
            
            VStack{
                Rectangle().frame(height: 60).foregroundColor(Color.green)
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
                Spacer()
            }
            
            //contenido
            VStack{
                Text("HOla")
            }
        }
        
        
        
        
    }
}

struct NavegacionView_Previews: PreviewProvider {
    static var previews: some View {
        NavegacionView()
    }
}
