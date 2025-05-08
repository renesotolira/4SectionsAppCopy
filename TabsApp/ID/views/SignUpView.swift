//
//  SignUpView.swift
//  TabsApp
//
//  Created by Efren Reyes on 11/03/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var pageIndex = 0
    @State private var mail = ""
    @State private var codes = ["","","",""]
    @StateObject var signUpViewModel = SignUpViewModel()
    
    //cache
    @AppStorage("email") var savedMail: String = ""
    
    private let pages: [SignUpPage] = SignUpPage.signUpSteps
    
    func nextPage(){
        
        var size: Int = pages.count
        size = size - 1
        
        if(pageIndex == 2){
            
            let finalCode = codes.joined(separator: "-")
            signUpViewModel.sendData(code: finalCode, mail: mail)
            
        }
        
        if(pageIndex < size){
            pageIndex += 1
        }
    }
    
    func previousPage(){
        if(pageIndex > 0){
            pageIndex -= 1
        }
    }
    
    
    var body: some View {
        ZStack {
            //empiezan los if
            if(signUpViewModel.showMyCard || !savedMail.isEmpty ){
                TarjetaView(viewmodel: signUpViewModel, page: $pageIndex)
            }
            else if(!signUpViewModel.showFinalScreen){
                ZStack{
                    ///picker
                    VStack(spacing: 0){
                        
                        Picker(selection: self.$pageIndex, label: Text("")) {
                            ForEach(pages){page in
                                Text("page \(page.tag)").tag(page.tag)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        .opacity(0)
                        
                        
                        ZStack{
                            //codigo repetido
                            ForEach(pages){page in
                                VStack{
                                    VStack(spacing:20){
                                        
                                        SwiftUIGIFPlayerView(gifName: page.gif)
                                            .frame(width: 250, height: 250, alignment: .center)
                                        Text(page.nameStep)
                                            .font(.custom("Montserrat-Bold", size: CGFloat(page.size)))
                                            .padding(4)
                                        
                                        
                                        
                                        if(pageIndex == 1){
                                            
                                            TextField("ejemplo@gmail.com", text:$mail)
                                                .cornerRadius(3.0)
                                                .font(.title)
                                                .padding(.horizontal, 24)
                                                .disableAutocorrection(true)
                                                .keyboardType(.emailAddress)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10) // Redondear el borde
                                                        .stroke(Color.blue, lineWidth: 2)
                                                )
                                                .padding(.horizontal , 20)
                                        }
                                        else if(pageIndex == 2){
                                            
                                            HStack{
                                                
                                                ForEach(Array(codes.enumerated()), id: \.offset) {
                                                    index, element in
                                                    VerificationCodeView(innerCode: $codes[index])
                                                }
                                                
                                                
                                            }
                                            
                                        }else if(pageIndex == 3){
                                            Text(signUpViewModel.message)
                                        }
                                    }
                                    
                                    Spacer()
                                    HStack{
                                        
                                        if(signUpViewModel.showPreviousButton(pageIndex)){
                                            Button(action:{
                                                previousPage()
                                            }){
                                                
                                                Text("Anterior")
                                                    .font(.custom("Montserrat-Bold", size: 24))
                                            }
                                        }
                                        
                                        if (signUpViewModel.showNextButton(pageIndex)){
                                            Button(action:{
                                                nextPage()
                                            }){
                                                
                                                Text(page.next)
                                                    .font(.custom("Montserrat-Bold", size: 24))
                                            }
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                    
                                }
                                .opacity(pageIndex == page.tag ? 1 : 0)
                                
                            }
                            
                            //end codigo repetido
                        }
                        
                    }
                    ///
                }
            }
            else if(signUpViewModel.success){
                SuccessSignUpView()
                    .transition(.move(edge: .trailing))
            }
            else{
                ErrorSignUpView(viewmodel: signUpViewModel, page: $pageIndex)
                    .transition(.move(edge: .bottom))
                //efecto transición chevere aparecera el error de abajo hacia arriba
            }
            //terminan los else
        }
        .animation(.easeInOut(duration: 2.0), value: signUpViewModel.showFinalScreen)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .navigationBarItems(leading:
                                Text("Tarjeta Digital").font(.largeTitle)
        )
            
    }
    
  
   
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
