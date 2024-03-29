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
  
  @State var editingIdeaId : UUID? = nil
  
  var activityView: some View {
    Group(){
      self.model.ideas.map{
        result in
        ViewBuilder.buildEither(first: EmptyView())
        } ?? ViewBuilder.buildEither(second: ActivityIndicator(style: .large).onAppear(perform: {
          self.model.fetchIdeas()
        }).transition(.opacity))
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
            idea in
            IdeaRowView(idea: idea, editMode: idea.id == self.editingIdeaId ).gesture(DragGesture()
              .onEnded{_ in
                withAnimation(.basic(duration: 4)) {
                  self.editingIdeaId = idea.id
                }
            }).gesture(TapGesture().onEnded({
              if idea.id == self.editingIdeaId {
                
                withAnimation(.basic(duration: 4)) {
                   self.editingIdeaId = nil
                }
               
              }
            }))
            }.navigationBarTitle(Text("Ideas"))}.transition(.opacity)
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
    let database = try! JSONDatabase()
   let editId = (try? database.ideas.get())?.randomElement()?.id
   return IdeaListView(editingIdeaId: editId).environmentObject(DataViewModel(database: database))
  }
}
#endif
