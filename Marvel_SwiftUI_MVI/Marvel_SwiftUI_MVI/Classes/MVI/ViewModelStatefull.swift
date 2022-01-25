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
    
    // output data
    var state: ViewState { get set}
    
    // navigation steps
    var steps: PassthroughSubject<ViewRoute, Never> { get set }
    
    // show alert
    var alert: AlertInfo? { get set }
    
    // input actions
    func setInputAction(_ action: InputAction)
}


