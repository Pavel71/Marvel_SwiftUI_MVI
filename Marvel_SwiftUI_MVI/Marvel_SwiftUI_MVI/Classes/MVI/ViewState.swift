//
//  ViewState.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import Foundation


protocol ViewStateable: Changeable {
    associatedtype DataStateble
    
    var isLoading: Bool { get set }
    var isEmpty: Bool { get set }
    var data: DataStateble { get set }
    
}

protocol DataStateble {}

protocol Changeable {}

extension Changeable {
    func change<T>(path: WritableKeyPath<Self, T>, to value: T) -> Self {
        var clone = self
        clone[keyPath: path] = value
        return clone
    }
}

