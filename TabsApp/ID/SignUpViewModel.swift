//
//  SignUpViewModel.swift
//  TabsApp
//
//  Created by rene on 18/03/25.
//

import Foundation
import SwiftUI


class SignUpViewModel: ObservableObject{
    
    @Published var loading =  false
    @Published var success = false
    @Published var message: String  = ""
    @Published var showFinalScreen = false //si tiene que mostrar o no las pantallas éxito o fail
    @Published var showMyCard = false //tarjeta virutal mostrarla o no.
    @AppStorage("email") var savedMail: String = ""
        
    /**
     si son las paginas donde pide correo o código de verificación muestre el boton de atras
     */
    func showPreviousButton(_ page: Int) -> Bool{
        return page > 0 && page < 3
    }
    
    /**
     Mostrará el boton de siguiente para todas las paginas excepto
      la que valida toda la info (codigo + mail)
     */
    func showNextButton(_ page: Int) -> Bool{
        return page < 3
    }
        
    func sendData(code: String, mail: String){
        DispatchQueue.main.async{
            self.loading = true //cargando o subiendo la info
            self.message = "Estamos validando tu información."
        }
     
        /*Simulamos*/
        DispatchQueue.main.asyncAfter(deadline: .now() + 4 ){
            //hasta que pasen 10 segundos ocurrirar lo de adentro
            //N pasos necesario de validación (meter toda la logica)
            /*
               -  -  -
             */
            if(code.isEmpty || mail.isEmpty){
                self.failSignUp()
            }else{
                self.successSignUp(mail)
            }
        }
    }//ciera funcion
    
    func failSignUp(){
        DispatchQueue.main.async{
            self.showFinalScreen = true//
            self.loading = false//posible removemo esta variable
            self.message = "No se pudo completar la solicitud, intentalo de nuevo."
            self.success = false
        }
    }
    
    func doAgain(){
        DispatchQueue.main.async{
            self.showFinalScreen = false
        }
    }
    
    func clearSession(){
        savedMail = ""
        DispatchQueue.main.async{
            self.showMyCard = false
            self.showFinalScreen = false
            self.message = ""
            self.success = false
        }
    }
    
    func successSignUp(_ mail: String){
       
        DispatchQueue.main.async{
            self.showFinalScreen = true
            self.loading = false
            self.message = "Felicidades registro exitoso."//
            self.success = true//
            DispatchQueue.main.asyncAfter(deadline: .now() + 5 ){
                //esperar 5 segundos para simular el exito.
                self.showMyCard = true
                self.savedMail = mail
            }
        }
    }
    
   /*
     logica viewmodel
        variables relacionado proceso
            Proceso de Registrar.
     
     
        Modelos
            la información
                 table
                    qty, name
     
     Modelo (back) <-- ViewModel (RH) --> View Cliente (FrontEnd)
     
        CALCULOS y resultados
     query = select * from pages where name =
     
     View
        Visual (Interfaz)
     
     
     ViewModel
            --> APi
             --> Manipular Cache (Preferencias)
             --> Base de datos
            --> Procesar imagenes
    
     */
    
}
