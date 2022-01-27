//
//  NavigationViewModifier.swift
//  Dot
//


import SwiftUI
import Combine


public struct NavigationViewModifier: ViewModifier {
    
    @ObservedObject public var navigation: Navigation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var nav: String?
    
    
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
//                    tag: navigation.isRoot ? "Root" : "",
//                    selection: $nav,
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
