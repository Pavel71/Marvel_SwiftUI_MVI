//
//  Navigation.swift
//  Dot
//
//  Created by Alex Nagy on 09.08.2021.
//

import SwiftUI
import Combine


public class Navigation: ObservableObject {
    
    @Published var isRoot: Bool
    
    public init(isRoot: Bool = false) {
        self.isRoot = isRoot
    }
    
    
    
    @Published public var isPushed = false
    @Published public var isPresented = false
    @Published public var isCovered = false
    @Published public var isPopBack = false
    @Published public var isPopToRoot = false
    @Published public var destination: AnyView?
    @Published public var onDismiss: (() -> Void)?
    
    public func present<Destination: View>(_ type: NavigationType, @ViewBuilder destination: () -> (Destination), onDismiss: (() -> Void)? = nil) {
        self.destination = AnyView(
            destination()
        )
        
        print("IS Root",isRoot)
        switch type {
        case .page:
            self.onDismiss = onDismiss
            isPushed = true
            
        case .sheet:
            self.onDismiss = onDismiss
            isPresented = true
        case .fullScreenCover:
            self.onDismiss = onDismiss
            isCovered = true
        }
    }
    
    public func pop() {
        isPopBack = true
    }
    
    public func popToRoot() {
        isPopToRoot = true
    }
    // I stay this logic here and implement it later
    // 1. need implement here pop to screen in stack
    // 2. need implement here pop to root
    
    
}
