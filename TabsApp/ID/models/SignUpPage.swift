//
//  SignUpPage.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import Foundation

//Modelo
struct SignUpPage: Identifiable, Equatable{
    let id = UUID()
    var nameStep: String
    var tag: Int
    var gif: String
    var next: String = "Siguiente"
    var size: Float = 26
    
    
    static var sampleSignUpPage = SignUpPage(
        nameStep: "Ejemplo Registro - Paso 1", tag: 0, gif: "typing")
    
    static var signUpSteps: [SignUpPage] = [
        SignUpPage(nameStep: "Tramita tu Tarjeta Digital", tag: 0, gif: "tramita02", next: "Comenzar"),
        SignUpPage(nameStep: "Registro - Paso 1", tag: 1, gif: "typing"),
        SignUpPage(nameStep: "Hemos mandado un codigo de verificacion a tu correo.\nFavor de Ingresarlo", tag: 2, gif: "verificationCode", next: "Ingresar", size: 16 ),
        SignUpPage(nameStep: "Verificando información\nEspere un momento...", tag: 3, gif: "request", next: "Finalizar"),
      
    ]
}

