//
//  IdeaView.swift
//  Therbe
//
//  Created by Leo Dion on 8/27/19.
//

import SwiftUI
import Fakery

struct Idea : Identifiable {
  let id : UUID
  var name : String
}
struct IdeaView: View {
  @State var idea : Idea
    var body: some View {
      TextField("name", text: $idea.name)
    }
}

struct IdeaView_Previews: PreviewProvider {
  static let data : [Idea] = {
    faker in
    (1...Int.random(in: 15...25)).map{_ in Idea(id: UUID(), name: faker.lorem.sentence())
      }
  }(Faker(locale: "en-US"))
    
    static var previews: some View {
      TabView{
        NavigationView {
          List(data) {
            IdeaView(idea: $0)
          }.navigationBarTitle("Ideas")
        }.tabItem{
          VStack{
            Image("Idea", bundle: Bundle.main)
            Text("Ideas")
          }
        }
      }
    }
}
