//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI
import Combine

struct IdeaListView : View {
  @EnvironmentObject var model : DataViewModel
  
  var activityView: some View {
    Group(){
      self.model.ideas.map{
        result in
        ViewBuilder.buildEither(first: EmptyView())
        } ?? ViewBuilder.buildEither(second: ActivityIndicator(style: .large).onAppear(perform: {
          self.model.fetch()
        }).transition(.opacity))
    }
  }

  var listView: some View {
    let ideas = try? self.model.ideas?.get()
    return Group(){
      ideas.map{
        ideas in
        ViewBuilder.buildEither(first:
          List(ideas.identified(by: \.id)) {
            IdeaRowView(idea: $0)
        })
      } ?? ViewBuilder.buildEither(second: EmptyView())
    }
  }
  
  var errorView: some View {
    let error : Error?
    
    if case let .failure(actualError) = self.model.ideas {
      error = actualError
    } else {
      error = nil
    }
    
    return Group(){
      error.map{
        error in
        ViewBuilder.buildEither(first:
          Text(error.localizedDescription)
        )
        } ?? ViewBuilder.buildEither(second: EmptyView())
    }
  }
  
  var body: some View {
    ZStack {
      listView
      activityView
      errorView
    }
  }
}

#if DEBUG
struct IdeaListView_Previews : PreviewProvider {
  static var previews: some View {
    
    IdeaListView().environmentObject(DataViewModel(database: try! JSONDatabase()))
  }
}
#endif
