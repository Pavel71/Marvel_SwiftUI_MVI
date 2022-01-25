//
//  ThirdView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI

struct ThirdView: View {
    
    @StateObject var navigation: Navigation = Navigation()
    
    var body: some View {
        ZStack {
            Color.yellow
            
            VStack {
                Button(action: {
//                    navigation.selection = nil
                }) {
                    Text("pop to root")
//                    navigation
                    // need to make here pop to root
                    
                }
                
                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                    navigation.selection = "Details"
                    // need to make here dissmis
                    navigation.pop()
                }) {
                    Text("pop Previos")
                }
            }
           
        }.navigationBarHidden(true)
        .uses(navigation)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
