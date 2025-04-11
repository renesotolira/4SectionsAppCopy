//
//  Page.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import Foundation

struct Page: Identifiable, Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title example",
                                 description: "debuggind",
                                 imageUrl: "work",
                                 tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Bienveniod",description: "pagina 1",imageUrl:"cowork", tag: 0),
        Page(name: "Page 1",description: "pagina 1",imageUrl:"work", tag: 1),
        Page(name: "Page",description: "pagina 1",imageUrl:"people", tag: 2),
        
    ]
    
}
