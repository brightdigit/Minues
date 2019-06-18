//
//  IdeaListViewModel.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import SwiftUI
import Combine

final class IdeaListViewModel : BindableObject {
  let database = try! MetaContainer.shared.types(implements: DatabaseProtocol.Type.self)?.first?.init()
  let didChange = PassthroughSubject<IdeaListViewModel, Never>()
  
  var ideas : [IdeaProtocol]? {
    didSet {
      didChange.send(self)
    }
  }
  
  func fetch () {
    database!.ideas({
      ideas in
      DispatchQueue.main.async{
        self.ideas = ideas
      }
    })
  }
  
}
