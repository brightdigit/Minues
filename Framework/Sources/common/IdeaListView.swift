//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI

struct IdeaListView : View {
  var ideas : [IdeaProtocol]
  
  var body: some View {
    ZStack{
      NavigationView {
        List(self.ideas.identified(by: \.id)){
          IdeaRowView(idea: $0)
        }.navigationBarTitle(Text("Ideas"))
      }
      .brightness(0.75)
      .blur(radius: 3)
      ActivityIndicator(style: .large)
    }
  }
}

#if DEBUG
struct IdeaListView_Previews : PreviewProvider {
  static var previews: some View {
    IdeaListView(ideas: Database.shared.ideas)
  }
}
#endif
