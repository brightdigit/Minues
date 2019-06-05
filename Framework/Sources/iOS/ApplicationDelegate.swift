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
}
