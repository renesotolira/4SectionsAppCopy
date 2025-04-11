//
//  NoticiaIndividualApiModel.swift
//  TabsApp
//
//  Created by rene on 20/02/25.
//

import Foundation

struct NoticiaIndividualApiModel: Decodable{
    let titulo: String
    let contenido: String
    let imagen_predeterminada: String
    let imagen_negocio: String
    let nombre_negocio: String
}
