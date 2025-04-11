//
//  AhorcadoViewModel.swift
//  LegionAnime
//
//  Created by Rene SL on 24/10/23.
//

import Foundation
import SwiftUI

class ExampleNoticiasViewModel : ObservableObject {
    @Published var noticias : [NoticiaApiModel]
    
    
    init(){
        self.noticias = []
        exampleService()
    }
  
    
    func exampleService(){
       
        let paramsGet: String = "?id=0&name=adios"
        
        let paramsPost: Parameters = [
            "id" : String(0),
            "name" : "hola"
        ]
        //donde tengo params: nil sería paramsPost para peticion POST
        
        //let path: String = "v2/directorio/" + paramsGet //ejemplo de envio con parametros get
        let apiConnection = Connection()
        let path: String = "v1/posts"
        
        apiConnection.connection ( method: "GET", path : path, params: nil ) { connected, error , response in
            if connected , let json = response {
                self.processResponse(datos: json) //conecto con el server y tiene respuesta
            }else{
                print("Error fue  \(error)")
            }
        }
    }
    
    private func processResponse(datos: Data){
        DispatchQueue.main.async{
            do{
                let decoded = try JSONDecoder().decode( [NoticiaApiModel].self , from: datos)
                self.noticias = decoded
                
            }catch let error {
                print("Error no se pudo convertir de json a Noticia porque \(error)")
                return
            }
        }
    }
   

   

}
