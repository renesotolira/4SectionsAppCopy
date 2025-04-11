//
//  VerificationCodeView.swift
//  TabsApp
//
//  Created by rene on 18/03/25.
//

import SwiftUI

struct VerificationCodeView: View {
    @Binding var innerCode: String
    
    func formatNumber(input: String) -> String{
        var cleanedInput = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        // Limitar a 2 dígitos
        if cleanedInput.count > 2 {
            cleanedInput = String(cleanedInput.prefix(2))
        }
        return cleanedInput
    }
    
    var body: some View {
        TextField("00", text: $innerCode)
            .keyboardType(.numberPad)
            .onChange(of: innerCode){ newValue in
                innerCode = formatNumber(input: newValue)
            }
            .frame(width: 30)
            .padding(8)
            .overlay(
                Rectangle().stroke(Color.blue, lineWidth: 2)
            )
            .padding(8)
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView(innerCode: .constant(""))
    }
}
