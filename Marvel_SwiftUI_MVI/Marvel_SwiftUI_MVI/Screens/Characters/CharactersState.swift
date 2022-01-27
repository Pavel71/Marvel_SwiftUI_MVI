//
//  CharactersState.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import Foundation

extension CharactersScreenView {
    
    
    struct ViewState: ViewStateable {
        
        var isLoading: Bool = false
        
        var isEmpty: Bool = false
        
        var data = CharactersModel()
        
        
    }
}





