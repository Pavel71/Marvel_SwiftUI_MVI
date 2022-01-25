//
//  ViewModelStatefull.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import Foundation
import Combine

protocol ViewModelStatefull {
    associatedtype InputAction
    associatedtype ViewState
    associatedtype ViewRoute
    
    
    // @Published
    var state: ViewState { get set}
    
    // navigation steps
    var steps: PassthroughSubject<ViewRoute, Never> { get set }
    
   
    // @Published
    var alert: AlertInfo? { get set }
    
    // input actions
    func setInputAction(_ action: InputAction)
}


