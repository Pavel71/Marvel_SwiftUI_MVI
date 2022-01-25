//
//  CharactersView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct CharactersScreenView: View {
    
    @ObservedObject var viewModel: CharactersViewModel
    @StateObject var navigation =  Navigation(isRoot: true)
    
    @State private var alertData: AlertInfo? = nil
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                SearchBarView(typeAction: viewModel.setInputAction)
                
                if (viewModel.state.isLoading) {
                    ProgressView()
                }
                
                if (viewModel.state.isEmpty) {
                    Text("Empty View")
                }
                
                // show data if we have dat
                
                if (viewModel.state.data.list.isEmpty == false) {
                    Text("Here we have data")
                }
                    
                
            }
            .uses(navigation)
            .navigationTitle("Marvel")
            .onReceive(viewModel.steps) { step in
                
                switch step {
                case .openDetails:

                    
                    navigation.present(.page, destination: {
                        CharacterDetalsScreenView()
                    }, onDismiss: {
                        print("Dissmis")
                    })

                }
            }
            .alert(item: $viewModel.alert) { alert in
                Alert(title: Text(alert.title),
                      message: Text(alert.message))
            }
//            .alert(item: $alertData) { alertData in
//                Alert(title: Text(alertData.title),
//                      message: Text(alertData.message))
//            }
            
            
            
        }
        
    }
}


//private struct CharacterListView: View {
//    
//    @EnvironmentObject var viewModel: CharactersViewModel
//    
//    
//    var body: some View {
//        
//        
//        
//    }
//}

private struct SearchBarView: View {
    
    @State private var query: String = ""
    
    var typeAction: (CharacterAction) -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            
            HStack(spacing: 10) {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search Character",text: $query.onUpdate {
                    typeAction(.query(str: query))
                })
                
            }.padding(.vertical, 10)
            
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: 5)
            
        }.padding()
        
    }
}


struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreenView(viewModel: CharactersViewModel())
    }
}
