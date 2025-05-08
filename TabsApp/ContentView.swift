//
//  ContentView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI



struct ContentView: View {

    @State var selectedTabItem = 0

    init() {
        setupNavigationBarAppearance()
    }
    
    func showTabImage(_ index: Int) -> Image {
        
        switch index {
           
        case 1:
            return Image(self.selectedTabItem == index ? Images.tabGridSelected : Images.tabGrid)
            
        case 2:
            return Image(self.selectedTabItem == index ? Images.tabIdSelected : Images.tabId)
            
        case 3:
            return Image(self.selectedTabItem == index ? Images.tabNotifSelected : Images.tabNotif)
            
        default:
            return Image(self.selectedTabItem == index ? Images.tabHomeSelected : Images.tabHome)
            
        }
        
       
    }
    
    @State private var showSplash = true
    
    var body: some View {
        ZStack{
            /*1 -> splashScreen  launcher  (2o3segundos)*/
            if(showSplash){
                
                Color.white
                //interfaz del icono
                VStack{
                    Image(Images.screenLogo)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                }
            }else{
                VStack{
                
                TabView(selection: $selectedTabItem){
                    NavigationView{
                        InicioView()
                    }
                    .tabItem {
                        showTabImage(0)
                    }
                    .tag(0)
                    
                    NavigationView{
                        ConveniosView()
                    }
                    .tabItem {
                        showTabImage(1)
                    }.tag(1)
                    
                    NavigationView{
                         SignUpView()
                    }
                    .tabItem {
                        showTabImage(2)
                    }.tag(2)
                    
                    NavigationView{
                        NotificationsView()
                    }
                    .tabItem {
                        showTabImage(3)
                    }.tag(3)
                    
                }
                //.accentColor(Color.green)
                .padding(.bottom , 8)
                
            }
            }
            
            
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ){
                withAnimation(){
                    showSplash = false
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


