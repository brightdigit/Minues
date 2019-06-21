//
//  Project.swift
//  therbe
//
//  Created by Leo Dion on 6/19/19.
//

import Foundation

struct Project : Codable, ProjectProtocol {
  let id: UUID  
  let name : String
  let ideaId : UUID
}
