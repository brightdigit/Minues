//
//  TabbedRootView.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import SwiftUI

struct TabbedRootView : View {
  var body: some View {
    TabbedView{
      IdeaListView()
        .tabItemLabel(Text("Ideas"))
      
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
