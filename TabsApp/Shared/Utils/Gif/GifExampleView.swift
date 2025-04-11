//
//  NowLoadingView.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import SwiftUI

struct GifExampleView: View {
    
    @Binding var showLoading : Bool
    
    private func isLoading() -> CGFloat {
        return showLoading ? 1 : 0
    }
    
    var body: some View {
        if showLoading {
            ZStack{
               
                /*Image(Images.galaxy)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .opacity(isLoading())*/
                
                
                SwiftUIGIFPlayerView(gifName: "typing")
                    //.opacity(Double(isLoading()))
                
            }.edgesIgnoringSafeArea(.all)
                //.opacity(isLoading())
                .frame(minHeight:0, maxHeight:  showLoading ? .infinity : 0)
        }
    }
}

struct GifExampleView_Previews: PreviewProvider {
    static var previews: some View {
        GifExampleView(showLoading: .constant(true))
    }
}
