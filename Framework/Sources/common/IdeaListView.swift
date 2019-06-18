//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI
import Combine

struct IdeaListView : View {
  @EnvironmentObject var model : IdeaListViewModel
  
  var body: some View {
    Group(){
      self.model.ideas.map{
        ideas in
        ViewBuilder.buildEither(first:
                  NavigationView {
                    List(ideas.identified(by: \.id)){
                      IdeaRowView(idea: $0)
                      }.navigationBarTitle(Text("Ideas"))
                  }.transition(.opacity)

        )
        } ?? ViewBuilder.buildEither(second: ActivityIndicator(style: .large).onAppear(perform: {
          self.model.fetch()
        }).transition(.opacity))
    }
  }
}

#if DEBUG
struct IdeaListView_Previews : PreviewProvider {
  static var previews: some View {
    IdeaListView().environmentObject(IdeaListViewModel())
  }
}
#endif
