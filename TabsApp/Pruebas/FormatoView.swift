//
//  FormatoView.swift
//  TabsApp
//
//  Created by rene on 13/03/25.
//

import SwiftUI


struct CardNumberInputView: View {
   
    @State private var texto = ""
    @State var number = 100
    
    var body: some View {
        VStack(spacing: 20){
            
            Form{
                
                Section(header: Text("Contacto")){
                TextField("pais", text: $texto )
                
                TextField("nombre", text: $texto )
                }
                
                Section(header: Text("Comenario"),
                        footer:HStack {
                            Spacer()
                            Label("version 1.0",
                                  systemImage: "iphone")
                            Spacer()
                                               }
                        ){
                TextEditor(text: $texto)
                }
                
            }//.padding()
        }
    }
}

// **TextField personalizado con NextField para cambiar foco**
struct CustomTextField: UIViewRepresentable {
    
    @Binding var text: String
    var nextField: UITextField?
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, nextField: nextField)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        var nextField: UITextField?
        
        init(_ parent: CustomTextField, nextField: UITextField?) {
            self.parent = parent
            self.nextField = nextField
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let newText = (textField.text ?? "") + string
            if newText.count > 4 { return false } // Limitar a 4 caracteres
            
            DispatchQueue.main.async {
                self.parent.text = newText
                if newText.count == 4 { // Pasar al siguiente campo
                    self.nextField?.becomeFirstResponder()
                }
            }
            return true
        }
    }
}
struct CardNumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        CardNumberInputView()
    }
}
