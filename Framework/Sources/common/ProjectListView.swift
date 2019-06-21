//
//  ProjectListView.swift
//  therbe
//
//  Created by Leo Dion on 6/21/19.
//

import SwiftUI

struct ProjectListView : View {
  @EnvironmentObject var model : DataViewModel
  
  var activityView: some View {
    Group(){
      self.model.projects.map{
        result in
        ViewBuilder.buildEither(first: EmptyView())
        } ?? ViewBuilder.buildEither(second: ActivityIndicator(style: .large).onAppear(perform: {
          self.model.fetchProjects()
        }).transition(.opacity))
    }
  }
  
  var listView: some View {
    let projects : [ProjectProtocol]?
    
    if case let .success(actualProjects) = self.model.projects {
      projects = actualProjects
    } else {
      projects = nil
    }
    
    return projects.map{
      projects in
      NavigationView {
        List(projects.identified(by: \.id)) {
          ProjectRowView(project: $0)
          }.navigationBarTitle(Text("Projects"))}.transition(.opacity)
    }
  }
  
  var errorView: some View {
    let error : Error?
    
    if case let .failure(actualError) = self.model.projects {
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
struct ProjectListView_Previews : PreviewProvider {
  static var previews: some View {
    ProjectListView().environmentObject(DataViewModel(database: try! JSONDatabase()))
  }
}
#endif
