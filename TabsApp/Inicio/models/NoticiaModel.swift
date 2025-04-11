//
//  NoticiaModel.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import Foundation

struct NoticiaModel : Identifiable{
    let uuid: UUID = UUID()
    let id: Int
    let image: String
    let title: String
    let description: String
}
