//
//  AppDelegate.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }



}


@main
struct MarvelApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
  
  var body: some Scene {
    WindowGroup {
        HomeView()
    }
  }
}
