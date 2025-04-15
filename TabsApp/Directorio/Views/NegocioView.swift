//
//  NegocioView.swift
//  TabsApp
//
//  Created by rene on 04/03/25.
//

import SwiftUI

import SwiftUI

struct NegocioView: View {
    let screenAncho = UIScreen.main.bounds.width
    var id: Int
    @StateObject var conveniosApi = ConveniosViewModel()
    var body: some View {
        ScrollView(){
            VStack(alignment:.leading, spacing:12){
                HStack(){
                    Spacer()
                    VStack{
                        ZStack{
                            VStack(spacing:0){
                            Rectangle().fill(Color("lightRed"))
                                .frame(
                                    width: screenAncho,
                                    height:125)
                            Rectangle().fill(Color.white)
                                    .frame(
                                        width: screenAncho,
                                        height:125)
                            }
                            
                        ImagesVisualizer(
                            url: conveniosApi.negocio.imagen_predeterminada,
                            width: 200,
                            height: 200,
                            contentScale: .fit)
                            .padding(0)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        
                        }
                        Text(conveniosApi.negocio.titulo)
                            .font(.custom("Montserrat-Bold", size: 18))
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing:12){
                if(conveniosApi.negocio.beneficiosList.count > 0) {
                    Text("Beneficios:")
                        .bold()
                        .font(.custom("Montserrat-Bold", size: 18))
                    ForEach(conveniosApi.negocio.beneficiosList, id: \.self){
                        item in
                    
                        if(!item.isEmpty){
                            HStack{
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.green)
                                    .font(.title3)
                                Text(item)
                                    .font(.custom("Montserrat-Regular", size: 18))
                            }
                        }
                        
                    }
                    
                }
                
                Text(conveniosApi.negocio.aclaraciones)
                    .font(.custom("Montserrat-Regular", size: 18))
                
                }
                .padding()
                
            }
            .padding(0)
            .onAppear(){
               
                conveniosApi.getNegocioById(id: id)
            }
            .navigationTitle(conveniosApi.negocio.titulo)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
        
    }
}

struct NegocioView_Previews: PreviewProvider {
    static var previews: some View {
        NegocioView(id: 6017)
    }
}
