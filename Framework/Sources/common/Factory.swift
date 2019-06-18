//
//  Factory.swift
//  therbe
//
//  Created by Leo Dion on 6/18/19.
//

import Foundation

struct Factory<Element> {
  enum FactoryError : Swift.Error {
    case noAvailableType
  }
  
  func create (fromTypes typesClosure : (([Element.Type]) throws -> Element.Type), instantiateBy: ((Element.Type) throws -> Element)) throws -> Element {
    guard let types = MetaContainer.shared.types(implements: Element.Type.self) else {
      throw FactoryError.noAvailableType
    }
    let type = try typesClosure(types)
    return try instantiateBy(type)
  }
}
