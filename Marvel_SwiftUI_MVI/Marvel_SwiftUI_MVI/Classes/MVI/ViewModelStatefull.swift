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
    var state: ViewState { get }
    
    // navigation steps
    var _steps: PassthroughSubject<ViewRoute, Never> { get }
    var steps: AnyPublisher<ViewRoute, Never> { get }
   
    // @Published
    var alert: AlertInfo? { get }
    
    // input actions
    func setInputAction(_ action: InputAction)
}

