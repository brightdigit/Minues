//
//  ProjectProtocol.swift
//  therbe
//
//  Created by Leo Dion on 6/21/19.
//

import Foundation

protocol ProjectProtocol {
  var id: UUID { get }
  var name : String { get }
  var ideaId : UUID { get }
}
