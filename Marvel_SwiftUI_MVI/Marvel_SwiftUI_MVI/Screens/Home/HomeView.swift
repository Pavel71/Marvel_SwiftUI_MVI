//
//  ContentView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.lightGray
        }
    
    var body: some View {
        TabView {
            CharactersScreenView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("characters")
                }
            
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("books")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
