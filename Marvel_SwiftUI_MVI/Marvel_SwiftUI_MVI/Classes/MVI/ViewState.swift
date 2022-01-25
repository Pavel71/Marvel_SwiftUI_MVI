//
//  ViewState.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import Foundation


protocol ViewStateable {
    associatedtype DataStateble
    
    var isLoading: Bool { get set }
    var isEmpty: Bool { get set }
    var data: DataStateble { get set }
    var errorData : AlertInfo { get set }
    
}

protocol DataStateble {}


struct AlertInfo: Identifiable {
    var id = UUID()
    var title: String = ""
    var message: String = ""
    var code: Int? = nil
}
