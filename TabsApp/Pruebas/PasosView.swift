//
//  PasosView.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import SwiftUI

struct PasosView: View {
    /*https://www.youtube.com/watch?v=OPTzgeIKMgU&ab_channel=Indently*/
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(pages){
                page in
                
                VStack{
                    Spacer()
                    PageView(page:page)
                    Spacer()
                    if page == pages.last {
                        Button("Registrar", action: goToZero)
                            //.buttonStyle(.bordered)
                        
                    }else{
                        Button("siguiente", action: incrementPage)
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .onAppear(){
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
        //.tabViewStyle(.page)
    }
    
    func incrementPage(){
        pageIndex += 1
    }
    
    func goToZero(){
        pageIndex = 0
    }
    
}

struct PasosView_Previews: PreviewProvider {
    static var previews: some View {
        PasosView()
    }
}
