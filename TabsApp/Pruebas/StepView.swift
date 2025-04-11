//
//  StepView.swift
//  TabsApp
//
//  Created by rene on 11/03/25.
//

import SwiftUI

struct MultiStepForm: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                StepView(title: "Nombre", placeholder: "Ingresa tu nombre", text: $name, selectedTab: $selectedTab, nextStep: 1)
                    .tag(0)
                
                StepView(title: "Correo Electrónico", placeholder: "Ingresa tu correo", text: $email, selectedTab: $selectedTab, nextStep: 2)
                    .tag(1)
                
                StepView(title: "Contraseña", placeholder: "Ingresa tu contraseña", text: $password, selectedTab: $selectedTab, isLastStep: true)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct StepView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    @Binding var selectedTab: Int
    var nextStep: Int? = nil
    var isLastStep: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if isLastStep {
                Button("Finalizar") {
                    print("Formulario completado: \(text)")
                }
                .padding()
                .disabled(text.isEmpty)
            } else {
                Button("Siguiente") {
                    if !text.isEmpty {
                        selectedTab = nextStep ?? selectedTab
                    }
                }
                .padding()
                .disabled(text.isEmpty)
            }
        }
    }
}

struct MultiStepForm_Previews: PreviewProvider {
    static var previews: some View {
        MultiStepForm()
    }
}
