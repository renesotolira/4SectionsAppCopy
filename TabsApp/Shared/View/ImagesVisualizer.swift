//
//  ImagesVisualizer.swift
//  TabsApp
//
//  Created by rene on 06/02/25.
//

import SwiftUI

///Images Visualize convierte un url string a Imagen para la interfaz , tiene como 4to parametro contentScale predeterminado es ContentMode = .fit
struct ImagesVisualizer: View {
    
    let url: String
    let width: CGFloat
    let height: CGFloat
    var contentScale: ContentMode = .fit
  
    
    var body: some View {
        if let validUrl = URL( string: url){
            
            AsyncImage( url: validUrl,
                        placeholder: { Text("Loading ...") },
                        image: { Image(uiImage: $0).resizable() }
            )
            .frame( width: width , height: height)
            .aspectRatio(1, contentMode: contentScale)
        }
    }
    
}

struct ImagesVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        ImagesVisualizer(url: "https://seccionuno.org/wp-content/uploads/2025/01/day-pass-hotel-posada-de-tampico-150x150.jpg", width: 90,height: 90 )
    }
}

