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
  let title : String
  
  init(id: UUID, title: String) {
    self.id = id
    self.title = title
  }
}
