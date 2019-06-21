//
//  TabbedRootView.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import SwiftUI
import Combine

struct TabbedRootView : View {
  var body: some View {
    TabbedView{
      IdeaListView()
        .tabItemLabel(
          VStack{
            Image("Idea")
            Text("Ideas")
          }).tag(0)
      ProjectListView()
        .tabItemLabel(
          VStack{
            Image("Project")
            Text("Projects")
          }
      ).tag(1)
    }
  }
}

#if DEBUG
struct TabbedRootView_Previews : PreviewProvider {
  static var previews: some View {
    TabbedRootView()
  }
}
#endif
