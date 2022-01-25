//
//  CharacterDetalsScreenView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI

struct CharacterDetalsScreenView: View {
    
    @StateObject var navigation = Navigation()
//    EnvironmentObject
    
    
    var body: some View {
        
       
            
            ZStack {
                Color.purple
                VStack {
                    Button(action: {
                        navigation.pop()
    //                    navigation.selection = "Third"
                    }) {
                        Text("Go to Back")
                    }
                    
                    Button(action: {
                        navigation.present(.page, destination: {
                            ThirdView()
                        }, onDismiss: {
                            print("Dissmiss Third")
                        })
    //                    navigation.selection = "Third"
                    }) {
                        Text("Go to Third")
                    }
                }
                .navigationTitle("Details")
               .uses(navigation)
            
//            NavigationLink(destination: ThirdView(), tag: "Third", selection: $navigation.selection) { EmptyView() }
        }
        
        
        
        
    }
}

struct CharacterDetalsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetalsScreenView()
    }
}
