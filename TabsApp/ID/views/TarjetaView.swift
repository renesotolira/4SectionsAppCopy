//
//  TarjetaView.swift
//  TabsApp
//
//  Created by rene on 27/03/25.
//

import SwiftUI

struct TarjetaView: View {
    
    @ObservedObject var viewmodel: SignUpViewModel
    @Binding var page: Int
    @State var showQR = false
    
    let title: String = "Sindicato de Trabajadores Petroleros de la Republica Mexicana"
    
    let status: String  = "Socio Activo"
    
    let user = UserModel( name: "Juan Perez Perez", memberNumber: "1A523746", workerNumber: "523746", date: "27/07/2016", workspace: "501 TASP MADERO", department: "Dibujo")
    
    func showOrHideQR(){
        withAnimation(.easeInOut(duration: 1.5)){
            showQR.toggle()
        }
    }
    
   
    var body: some View {
      
        VStack(spacing: 12){

            Group{
                
                Text( title.uppercased())
                    .lineLimit(nil)
                   .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(status.uppercased())
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
            

                //demas datos
                VStack(alignment: .leading){
                    
                    HStack(){
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text(user.name).font(.title)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                
                    HStack{
                        Text("No. Socio: \(user.memberNumber)")
                        Text("Ficha: \(user.workerNumber)")
                    }.padding(.vertical, 4)
                    
                    Text("Ingreso: \(user.date)").padding(.vertical, 4)
                    
                    Text("Centro de trabajo:")
                    Text(user.workspace)
                        .padding(.bottom, 4)
                    
                    Text("Departamento:")
                    Text(user.department)
                        .padding(.bottom, 4)
                    
                    
                    
                    
                    HStack(alignment: .top){
                       
                        Button(action:{
                            showOrHideQR()
                        }){
                            Text("Mostrar QR")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                        
                        Spacer()
                        
                        Button(action:{
                            page = 0
                            viewmodel.clearSession()
                        }){
                            Text("Cerrar Sesión")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                        
                       
                    }
                   
                    
                }
                //termina vstack de datos
            }
    
        }
        .padding()
        .overlay(
            ZStack{
                Color.black.opacity(0.8)
                
                VStack{
                    Image("qrcode")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                        
                    Button(action:{
                        showOrHideQR()
                    }){
                        Text("Regresar")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                    //aqui termina Button
                }
            }.opacity(showQR ? 1 : 0 )
        )
       
    }
}

struct TarjetaView_Previews: PreviewProvider {
    static var previews: some View {
        TarjetaView(viewmodel: SignUpViewModel(), page: .constant(4))
    }
}


