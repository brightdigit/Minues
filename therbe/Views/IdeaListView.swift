//
//  IdeasListView.swift
//  Therbe
//
//  Created by Leo Dion on 8/27/19.
//

import SwiftUI
import Fakery


struct IdeaListView: View {
  @State var ideas : [Idea]
  
  var body: some View {
        List(ideas) {
          IdeaView(idea: $0).
        }.navigationBarTitle("Ideas")
      
    
  }
}

struct IdeaListView_Previews: PreviewProvider {
  static let data : [Idea] = {
    faker in
    (1...Int.random(in: 15...25)).map{_ in Idea(id: UUID(), name: faker.lorem.sentence())
      }
  }(Faker(locale: "en-US"))
  static var previews: some View {
    IdeaListView(ideas: data)
  }
}
