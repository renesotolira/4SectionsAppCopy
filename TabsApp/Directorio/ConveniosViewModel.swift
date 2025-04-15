//
//  ConveniosViewModel.swift
//  TabsApp
//
//  Created by rene on 11/02/25.
//

import Foundation

class ConveniosViewModel: ObservableObject{
    
    @Published var convenios: [ConveniosApiModel] //arreglo
    @Published var listado: [ListadoApiModel] //arreglo
    @Published var negocio: NegocioApiModel //objeto
    @Published var searchNegocios : [NegociosListaApiModel]//arreglo
    let apiConnection = Connection()
    
    init(){
        self.convenios = [] //es un arreglo vacio
        self.listado = []
        self.negocio = NegocioApiModel(
            titulo: "",
            imagen_predeterminada: "" ,
            beneficios: "",
            aclaraciones: "")
        self.searchNegocios = []
    }
    
    func searchBusiness(_ search: String) -> [NegociosListaApiModel] {
        return searchNegocios.filter{$0.titulo.lowercased().contains(search.lowercased())}
    }
    
    //
    func getAllBusiness(){
        apiConnection.connection(method: "GET", path: "su/v1/negociosList/"){ connected, error, response in
            if connected, let json = response{
                self.apiConnection.printJson(data: json)
                self.processResponse(datos: json, which: "allBusiness")
            }else{
                print("Error \(error) ")
            }
        }
    }
    
    func getListadoById(id: Int){
       
        //su/v1/negociosByCat/71
        apiConnection.connection(method: "GET", path: "su/v1/negociosByCat/\(id)"){ connected, error, response in
            if connected, let json = response{
                //apiConnection.printJson(data: json)
                self.processResponse(datos: json, which: "listado")
            }else{
                print("Error \(error) ")
            }
        }
    }
    
    func getNegocioById(id: Int){
        //seccionuno.org/wp-json/su/v1/negocioByID/6017
        apiConnection.connection(method: "GET", path: "su/v1/negocioByID/\(id)"){ connected, error, response in
            if connected, let json = response{
                //apiConnection.printJson(data: json)
                self.processResponse(datos: json, which: "negocio")
            }else{
                print("Error \(error) ")
            }
        }
    }
    
    func getCategorias(){
        getAllBusiness()
        apiConnection.connection(method: "GET", path: "su/v1/categories/") { connected, error , response in
            
            if connected, let json = response{
                //self.apiConnection.printJson(data: json)
                self.processResponse(datos: json, which: "categorias")
            }else{
                print("Error \(error) ")
            }
        }
    }
    
    private func processResponse(datos: Data, which: String){
        DispatchQueue.main.async{
            do{
                if(which == "categorias"){
                    let decoded = try JSONDecoder().decode( [ConveniosApiModel].self , from: datos)
                    self.convenios = decoded
                }else if(which == "listado"){
                    let decoded = try JSONDecoder().decode( [ListadoApiModel].self , from: datos)
                    self.listado = decoded
                }
                else if(which == "allBusiness"){
                    let decoded = try JSONDecoder().decode( [NegociosListaApiModel].self , from: datos)
                    self.searchNegocios = decoded
                }
                else{ //negocio individual
                    let decoded = try JSONDecoder().decode( NegocioApiModel.self , from: datos)
                    self.negocio = decoded
                }
            }catch let error {
                print("Error no se pudo convertir de json a Noticia porque \(error)")
                return
            }
        }
    }
    
}
