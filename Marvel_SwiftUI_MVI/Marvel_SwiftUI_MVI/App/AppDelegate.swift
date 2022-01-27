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
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.
      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      // Called when the user discards a scene session.
      // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
      // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }



}


@main
struct MarvelApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // here we can set app delegate methods to start firebase or any another frameworks
        initSomeServicesWIthServiceLocator()
    }

  var body: some Scene {
    WindowGroup {
        HomeView()
    }
      // here we can chekc scene chaged
  }
    
    
    private func initSomeServicesWIthServiceLocator() {}
}



