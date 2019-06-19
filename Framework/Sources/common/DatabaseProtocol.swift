//
//  DatabaseProtocol.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation

protocol DatabaseProtocol : Interchangable {
  init () throws
  func ideas (_ completion: @escaping ([IdeaProtocol]) -> Void)
}



protocol Interchangable {
  static func create () throws -> Interchangable
}

extension DatabaseProtocol {
  static func create () throws -> Interchangable {
    return try self.init()
  }
}
struct Factory<ProtocolType : Interchangable> {
  static func create () throws -> ProtocolType {
    guard let types = MetaContainer.shared.types(implements: ProtocolType.Type.self) else {
      fatalError()
    }
    
    guard let type = types.first else {
      fatalError()
    }
    
    return try type.create() as! ProtocolType
  }
}
