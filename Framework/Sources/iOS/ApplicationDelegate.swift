//
//  ApplicationDelegate.swift
//  therbe-app_iOS
//
//  Created by Leo Dion on 6/2/19.
//

import UIKit

public class ApplicationDelegate: NSObject, UIApplicationDelegate {
  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    guard let types = MetaContainer.shared.types(implements: DoerProtocol.Type.self) else {
      return false
    }
    for type in types {
      print(type.init().name)
    }
    return true
  }
  
  
  public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    
    let configuration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    configuration.delegateClass = SceneDelegate.self
    return configuration
  }
}
