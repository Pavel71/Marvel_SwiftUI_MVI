//
//  ThirdView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI

struct ThirdView: View {
    
    @StateObject var navigation: Navigation = Navigation()
    @EnvironmentObject var rootNav: Navigation
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            VStack {
                Button(action: {
                    
                    rootNav.popToRoot()
                    // dissmiss presentation
                    navigation.pop()
                }) {
                    Text("pop to root")
                }
                
                Button(action: {

                    navigation.pop()
                }) {
                    Text("pop Previos")
                }
                
                Button(action: {
                    navigation.present(.fullScreenCover, destination: {
                        ThirdView()
                    })
                }) {
                    Text("Push new one Previos")
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
