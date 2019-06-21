//
//  Idea.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation
import SwiftUI

struct Idea : IdeaProtocol, Codable, Identifiable {
  let id: UUID
  let name : String
  let due: Date? = nil
  let priority : Float? = nil
  
  init(id: UUID, name: String) {
    self.id = id
    self.name = name
  }
}
