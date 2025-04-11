//
//  SuccessSignUpView.swift
//  TabsApp
//
//  Created by rene on 20/03/25.
//

import SwiftUI

struct SuccessSignUpView: View {
    var body: some View {
        VStack{
            SwiftUIGIFPlayerView(gifName: "success")
                .frame(width: 250, height: 250, alignment: .center)
            
            Text("Éxito")
        }
    }
}

struct SuccessSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessSignUpView()
    }
}
