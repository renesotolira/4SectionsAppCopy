//
//  NoticiaModel.swift
//  TabsApp
//
//  Created by rene on 28/01/25.
//

import Foundation

struct NoticiaApiModel: Decodable {
    let id: Int//id de la noticia
    let id_negocio: Int //id del negocio
    let title: String
    let content: String? /*acepta string o nil*/
    let featured_image: FeaturedImage
    let business_logo: String
    let business_name: String
    
    private enum CodingKeys: String, CodingKey{
        case id  //campos que quedan iguales separados por coma si es mas de uno
        case id_negocio
        
        case title = "titulo"
        case content = "descripcion_breve"
        case featured_image = "imagen_predeterminada"
        case business_logo = "imagen_negocio"
        case business_name = "nombre_negocio"
    }
    
}

struct FeaturedImage: Decodable, Hashable{
    let thumbnail: String
    let medium: String
    let large: String
}
