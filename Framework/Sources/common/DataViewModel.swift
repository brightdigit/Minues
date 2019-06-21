//
//  IdeaListViewModel.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import SwiftUI
import Combine

final class DataViewModel : BindableObject {
  let database : DatabaseProtocol
  let didChange = PassthroughSubject<DataViewModel, Never>()
  
  init (database: DatabaseProtocol) {
    self.database = database
  }
  
  var ideas : Result<[IdeaProtocol], Error>? {
    didSet {
      didChange.send(self)
    }
  }
  
  var projects : Result<[ProjectProtocol], Error>? {
    didSet {
      didChange.send(self)
    }
  }
  
  func fetchIdeas () {
    database.ideas({
      ideas in
      DispatchQueue.main.async{
        self.ideas = ideas
      }
    })
  }
  
  func fetchProjects () {
    database.projects({
      projects in
      DispatchQueue.main.async{
        self.projects = projects
      }
    })
  }
  
  
}
