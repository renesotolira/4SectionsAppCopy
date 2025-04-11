//
//  ErrorSignUpView.swift
//  TabsApp
//
//  Created by rene on 20/03/25.
//

import SwiftUI

struct ErrorSignUpView: View {
    @ObservedObject var viewmodel: SignUpViewModel
    @Binding var page: Int
    @State private var isVisible = false
    
    var body: some View {
        ZStack{
                VStack{
                    SwiftUIGIFPlayerView(gifName: "error")
                        .frame(width: 250, height: 250, alignment: .center)
                    
                    if(isVisible){
                        Text("Error, verifique la información que ingreso y vuela a intentarlo")
                        Button(action:{
                            page = 1
                            viewmodel.doAgain()
                        }){
                            Text("Volver a empezar")
                        }
                    }///visible termina
                }
                .padding(.horizontal, 8)
                .transition(.move(edge: .bottom))
                .animation(.spring(), value: isVisible)
            //response: 0.5, dampingFraction: 1
            
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ){
                withAnimation(){
                    isVisible = true
                }
            }
        }
    
    }
}

struct ErrorSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSignUpView(viewmodel: SignUpViewModel(), page: .constant(4))
    }
}
