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
    
    @ObservedObject var viewModel =  ViewModel()
    @StateObject var navigation =  Navigation()
    
    
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
                    
                    ForEach(viewModel.state.data.list, id: \.self) { item in
                        Text("Number data \(item)")
                        
                    }
                    
                }
                
                Spacer(minLength: 100)
                
                VStack(spacing: 20) {
                    
                    Button(action: {viewModel.setInputAction(.showEmpty)}) {
                        Text("Show Empty")
                    }
                    
                    Button(action: {viewModel.setInputAction(.loadContent)}) {
                        Text("Show Content")
                    }
                    
                    Button(action: {viewModel.setInputAction(.showAlertAction)}) {
                       Text("Show Alert")
                    }
                    
                    Button(action: {viewModel.setInputAction(.pushScreen)}) {
                        Text("Push Screen")
                    }
                }
                    
                
            }
            .showTabBar()
            .uses(navigation)
            .navigationTitle("Marvel")
            .onReceive(viewModel.steps) { step in
                
                switch step {
                case .openDetails:

                    navigation.present(.page, destination: {
                        CharacterDetalsScreenView().environmentObject(navigation)
                    }, onDismiss: {
                        print("Dissmis")
                    })

                }
            }
            .alert(item: $viewModel.alert) { alert in
                Alert(title: Text(alert.title),
                      message: Text(alert.message))
            }
            
            
        }
        
    }
}


private struct SearchBarView: View {
    
    @State private var query: String = ""
    
    var typeAction: (CharactersScreenView.ViewAction) -> Void
    
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
        CharactersScreenView(viewModel: CharactersScreenView.ViewModel())
    }
}
