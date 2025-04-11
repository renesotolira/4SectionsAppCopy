//
//  NegocioApiModel.swift
//  TabsApp
//
//  Created by rene on 04/03/25.
//

import Foundation

struct NegocioApiModel: Decodable {
    let titulo: String
    let imagen_predeterminada: String
    let beneficios: String//[Beneficio]
    let aclaraciones: String
    
    //---------------------------
    var beneficiosList: [String]{
        beneficios.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "]]")
    }
    //---------------------------
}
/*
struct Beneficio: Decodable, Hashable{
    let beneficio: String
}
 */
