//
//  SwiftUIGIFPlayerView.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import Foundation
import SwiftUI

public struct SwiftUIGIFPlayerView: UIViewRepresentable {
    
    private var gifName: String
    
    public init(gifName: String) {
        self.gifName = gifName
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwiftUIGIFPlayerView>) {
        
    }
    
    public func makeUIView(context: Context) -> UIView {
        return GIFPlayerView(gifName: gifName)
    }
    
}
