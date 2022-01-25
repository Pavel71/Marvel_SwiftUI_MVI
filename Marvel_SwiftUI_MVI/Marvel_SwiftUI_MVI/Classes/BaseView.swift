//
//  BaseView.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI
import Combine

struct BaseView<Content>: View where Content: View {
    
    
    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
    
    var body: some View {
        content
    }
    
    
}

