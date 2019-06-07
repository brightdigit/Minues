//
//  Application.swift
//  therbe-app_iOS
//
//  Created by Leo Dion on 6/2/19.
//

import UIKit

extension DoerProtocol {
  static var types : [Self]? {
    
    return MetaContainer.shared.types(implements: Self.self.self)
  }
}



public class Application : UIApplication {
  
}
