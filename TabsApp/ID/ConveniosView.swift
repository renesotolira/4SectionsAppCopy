//
//  ConveniosView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI

struct ConveniosView: View {
    
    @State var convenioBuscado : String = ""
    @State var isWritting: Bool = false
    @State var mensaje: String = ""
    @State var mensaje2: String = ""
    @State var password: String = ""
    
    func mensajes() -> String{
        return "hola"
    }
  
    var body: some View {
   
        ZStack{
            VStack(spacing: 16){
            
                Text(mensaje)
                Text("Hello, World!")
                    .opacity( isWritting ? 0 : 1)
                
                TextField("Ingrese su nombre", text: $mensaje2 )
                
                SecureField("Ingresa pasword", text: $password)
                
                TextField("Busca un convenio", text: $convenioBuscado )
                { //closure
                    isEditing in
                    //cuando tiene el foco se ejecuta
                    if(isEditing){
                        mensaje = "Estas escribiendo el usuario"
                    }else{
                       // mensaje = "yA no escribio nada"
                    }
                    isWritting = isEditing
                    
                } onCommit: {
                    //COMMIT si necesita del enter
                    if(convenioBuscado.caseInsensitiveCompare("NaZis") == .orderedSame){
                        mensaje = "Hey que paso!!"
                    }
                    isWritting = false
                }
                    .disableAutocorrection(true)
                    .autocapitalization(.words) //primer letra de cada palabra en maysucula
                    .keyboardType(.emailAddress)
                    .border(Color.red)
                    
                Text("Estas buscando el convenio \(convenioBuscado)")
                
            }.padding(12)
        }
    }
}

struct ConveniosView_Previews: PreviewProvider {
    static var previews: some View {
        ConveniosView()
    }
}
