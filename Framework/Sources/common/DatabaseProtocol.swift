//
//  DatabaseProtocol.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation

protocol DatabaseProtocol {
  init () throws
  //var ideas : [IdeaProtocol] { get }
  func ideas (_ completion: ([IdeaProtocol]) -> Void)
}

