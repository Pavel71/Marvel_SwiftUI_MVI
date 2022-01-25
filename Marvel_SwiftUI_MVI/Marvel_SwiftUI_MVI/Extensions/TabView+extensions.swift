//
//  TabView+extensions.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 25.01.2022.
//

import SwiftUI
import UIKit

extension UIView {
      
      func allSubviews() -> [UIView] {
          var res = self.subviews
          for subview in self.subviews {
              let riz = subview.allSubviews()
              res.append(contentsOf: riz)
          }
          return res
      }
    
    
        func hideWithAnimation(hidden: Bool, duration:Double = 0.4, complation: (() -> Void)? = nil) {
            UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
                self.isHidden = hidden
            }, completion: { _ in
                complation?()
            })
        }
        
        func alphaWithAnimation(alpha: CGFloat, duration:Double = 0.4, complation: (() -> Void)? = nil) {
            UIView.animate(withDuration: duration) {
                self.alpha = alpha
            } completion: { _ in
                complation?()
            }
        }
    
  }
  
  struct Tool {
      static func showTabBar() {
          UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
              if let view = v as? UITabBar {
                  view.hideWithAnimation(hidden: false)
              }
          })
      }
      
      static func hiddenTabBar() {
          UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
              if let view = v as? UITabBar {
                  view.hideWithAnimation(hidden: true)
              }
          })
      }
  }
  
  struct ShowTabBar: ViewModifier {
      func body(content: Content) -> some View {
          return content.padding(.zero).onAppear {
              Tool.showTabBar()
          }
      }
  }
  struct HiddenTabBar: ViewModifier {
      func body(content: Content) -> some View {
          return content.padding(.zero).onAppear {
              Tool.hiddenTabBar()
          }
      }
  }
  
  extension View {
      func showTabBar() -> some View {
          return self.modifier(ShowTabBar())
      }
      func hiddenTabBar() -> some View {
          return self.modifier(HiddenTabBar())
      }
  }
