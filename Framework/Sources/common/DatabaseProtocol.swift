//
//  DatabaseProtocol.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation

protocol DatabaseProtocol  {
  init () throws
  func ideas (_ completion: @escaping (Result<[IdeaProtocol], Error>) -> Void)
}


