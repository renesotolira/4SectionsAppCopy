//
//  NoticiasViewModel.swift
//  TabsApp
//
//  Created by rene on 28/01/25.
//

import Foundation

class NoticiasViewModel: ObservableObject{
    /*El protocolo ObservableObject
     es para que la view pueda ver los cambios de estado
     en las variable/propiedades de esta clase
     en tiempo real.
     */
    
    @Published var noticias: [NoticiaApiModel]
    @Published var noticia: NoticiaIndividualApiModel
    @Published var plainText: String = ""
    //variables que puede ser observada por la view
   
    init(){
        self.noticias = []
        self.noticia = NoticiaIndividualApiModel(titulo: "", contenido: "", imagen_predeterminada: "", imagen_negocio: "", nombre_negocio: "" )
    }
    
    func getNoticiaById(id: Int){
        let apiConnection = Connection()
        apiConnection.connection(method: "GET", path: "su/v1/postsByID/\(id)"){ connected, error, response in
            if connected, let json = response{
                self.processResponse(datos: json, which: "noticia")
            }else{
                print("Error \(error) ")
            }
        }
    }
    
    func getNoticiasFromApi(){
      let apiConnection = Connection()
        apiConnection.connection(method: "GET", path: "su/v1/posts"){
            connected, error, response in
            if connected, let json = response{
                //cambiar de json a objeto (clase)
                self.processResponse(datos: json, which: "all")
            }else{ //hubo un error puede ser de conexión, sin datos, tiempo de espera agotado,etc
                print("Erorr \(error)")
            }
        }
    }
    
    private func processResponse(datos: Data, which: String){
        DispatchQueue.main.async{
            //2ndo plano pero ya puedo interactura con el hilo principal
            do{
                /*Si es JSON Array
                 [ NOMBRE_DE_CLASE ].self
                 
                 si es jSON Object
                 NOMBRE_DE_CLASE.self
                 */
                if(which == "noticia"){
                    let decoded = try JSONDecoder().decode( NoticiaIndividualApiModel.self , from: datos)
                    let processedText = self.htmlToString(decoded.contenido)
                    self.plainText = processedText
                    self.noticia = decoded
                }else{
                    let decoded = try JSONDecoder().decode( [NoticiaApiModel].self , from: datos)
                    self.noticias = decoded
                }
                
            }catch let error {
                print("Error no se pudo convertir de json a Noticia porque \(error)")
                return
            }
        }
    }
    
    private func htmlToString(_ html: String) -> String {
           guard let data = html.data(using: .utf8) else { return html }
           let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
               .documentType: NSAttributedString.DocumentType.html,
               .characterEncoding: String.Encoding.utf8.rawValue
           ]
           if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
               return attributedString.string
           }
           return html
       }
}
