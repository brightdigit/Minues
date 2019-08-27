//
//  RootView.swift
//  Therbe
//
//  Created by Leo Dion on 8/27/19.
//

import SwiftUI
import Fakery

struct RootView: View {
  @State var ideas : [Idea]
  var body: some View {
    TabView{
      NavigationView{
        IdeaListView(ideas: ideas)
      }.tabItem {
        VStack{
          Image("Idea", bundle: Bundle.main)
          Text("Ideas")
        }
      }
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static let data : [Idea] = {
    faker in
    (1...Int.random(in: 15...25)).map{_ in Idea(id: UUID(), name: faker.lorem.sentence())
      }
  }(Faker(locale: "en-US"))
  static var previews: some View {
    RootView(ideas: data)
  }
}
