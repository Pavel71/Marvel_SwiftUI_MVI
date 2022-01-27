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
    @EnvironmentObject var rootNav: Navigation
    
    
    var body: some View {
        
       
            
            ZStack {
                Color.gray.ignoresSafeArea()
                VStack(spacing: 50) {
                    Button(action: {
                        navigation.pop()
                        // if need move to root
                        print("Button handling")
                        // also works
//                        rootNav.isPushed = false
    
                    }) {
                        Text("Go to Back")
                    }
                    
                    Button(action: {
                        navigation.present(.page, destination: {
                            ThirdView().environmentObject(rootNav)
                        }, onDismiss: {
                            print("Dissmiss Third")
                        })
                    }) {
                        Text("Push to Third")
                    }
                    
                    Button(action: {
                        navigation.present(.sheet, destination: {
                            ThirdView(isPresentationStyle: true).environmentObject(rootNav)
                        }, onDismiss: {
                            print("Dissmiss Third")
                        })
                    }) {
                        Text("Present to Third")
                    }
                }
                .hiddenTabBar()
                .navigationTitle("Details")
                .ignoresSafeArea()
                
               .uses(navigation)
            
        }
        
        
        
        
    }
}

struct CharacterDetalsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetalsScreenView()
    }
}
