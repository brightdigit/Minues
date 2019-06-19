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
        }))
    }
  }

  var listView: some View {    
    let ideas : [IdeaProtocol]?
    
    if case let .success(actualIdeas) = self.model.ideas {
      ideas = actualIdeas
    } else {
      ideas = nil
    }
    
    return ideas.map{
      ideas in
        NavigationView {
          List(ideas.identified(by: \.id)) {
            IdeaRowView(idea: $0)
            }.navigationBarTitle(Text("Ideas"))}
    }
  }
  
  var errorView: some View {
    let error : Error?
    
    if case let .failure(actualError) = self.model.ideas {
      error = actualError
    } else {
      error = nil
    }
    
    return error.map{
      Text($0.localizedDescription)
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
