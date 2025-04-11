//
//  Connection.swift
//  legionanime
//
//  Created by Rene SL on 13/09/23.
//

import Foundation

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

struct Connection {
    
    let TAG: String = "Connection"
    var params: String = "?"

    ///connection
    ///Hace la conexión a las API
    func connection( method: String , path: String , params: Parameters? = nil, _ completion: @escaping ( _ success: Bool, _ error: String, _ response: Data? ) -> Void){
        
        let baseURL : String = "https://seccionuno.org/wp-json/" //prefreible en Confis
        
        let endPoint : String = baseURL + path //url final
        print("Url final es \(endPoint)")
        guard let apiURL = URL(string: endPoint) else{
            return  completion( false, "Service Not Found", nil)
        }
        
        
        let con = setUrlRequest(method: method, apiURL: apiURL, parameters: params)
        let session = URLSession.shared
        
        let task = session.dataTask(with: con, completionHandler: { data, response, error -> Void in
            
            if let error = error {
                return  completion( false, "Error: " + error.localizedDescription, nil)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return  completion( false, "Error: " + "Response Not Found", nil)
            }
            
            
            if response.statusCode == 200 {
                
                guard let data = data else {
                    return  completion( false, "Data Not Found", nil)
                }
                
                return completion ( true, "",  data )
            }else{
                return  completion( false, "Status Not Found", nil)
            }
            
        })
        task.resume()
    }
    
    func setUrlRequest(method: String , apiURL: URL,  parameters: Parameters? = nil ) -> URLRequest{
        
        var urlRequest = URLRequest(url: apiURL)
    
        
        /*anexar cabeceras suponiendo que serán las mismas para todo el proyecto
        urlRequest.addValue("Bearer miToken123", forHTTPHeaderField: "Authorization")
        */
        
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = method //GET, POST,etc
    
        if let params = parameters { //si recibio parametros convertirlos para el envío
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            urlRequest.httpBody = jsonData
        }
    
        return urlRequest
    }
    
    func printJson(data: Data){
        do{
            let json = try JSONSerialization.jsonObject(with: data)
            print("respuesta es \(json)")
        }catch{
            print("no se pudo")
        }
    }
    
}
