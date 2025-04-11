//
//  NegociosListaApiModel.swift
//  TabsApp
//
//  Created by rene on 10/04/25.
//

import Foundation

struct NegociosListaApiModel: Decodable {
    let id: Int
    let titulo: String
    let imagen_predeterminada: ImagenPredeterminada
}

struct ImagenPredeterminada : Decodable, Hashable {
    let large: String
}
