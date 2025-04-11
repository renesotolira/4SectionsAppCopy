//
//  ListadoApiModel.swift
//  TabsApp
//
//  Created by rene on 18/02/25.
//

import Foundation

struct ListadoApiModel: Decodable{
    let id: Int
    let titulo: String
    let imagen_predeterminada: String
}
