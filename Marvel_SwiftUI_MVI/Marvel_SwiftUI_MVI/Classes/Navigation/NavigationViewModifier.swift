//
//  NavigationViewModifier.swift
//  Dot
//
//  Created by Alex Nagy on 09.08.2021.
//

import SwiftUI
import Combine


public struct NavigationViewModifier: ViewModifier {
    
    @ObservedObject public var navigation: Navigation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    private var isPopBackRecieved: AnyPublisher<Bool, Never> {
        navigation.$isPopBack.eraseToAnyPublisher()
    }
    private var isPushRecieved: AnyPublisher<Bool, Never> {
        navigation.$isPushed.eraseToAnyPublisher()
    }
    
    
    public func body(content: Content) -> some View {
        content
            .background(
                
                NavigationLink(
                    destination:
                        navigation.destination
                        .onDisappear {
                            navigation.onDismiss?()
                        },
//                    tag: "1",
//                    selection: "1",
                    isActive: $navigation.isPushed,
                   
                    label: {
                        EmptyView()
                            
                    })
                    
            )
            .onReceive(isPopBackRecieved) { isBack in
                
                if (isBack) {
                        self.presentationMode.wrappedValue.dismiss()
                }
            }
//            .onReceive(isPushRecieved) { isPush in
//                
//                if (isPush) {
//                    // if we want tp work with root
//                    navigation.isPushed = false
//                }
//            }
            
            
            .sheet(isPresented: $navigation.isPresented, onDismiss: navigation.onDismiss) {
                navigation.destination
            }
            .fullScreenCover(isPresented: $navigation.isCovered, onDismiss: navigation.onDismiss) {
                navigation.destination
            }
            
            
    }
}

public extension View {
    func uses(_ navigation: Navigation) -> some View {
        modifier(NavigationViewModifier(navigation: navigation))
           
    }
}
