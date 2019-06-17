//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI



struct IdeaListView : View {
    var body: some View {
      
      NavigationView {
        List(Database.shared.ideas.identified(by: \.id)){
          IdeaRowView(idea: $0)
        }.navigationBarTitle(Text("Ideas"))
      }
    }
}

#if DEBUG
struct IdeaListView_Previews : PreviewProvider {
    static var previews: some View {
        IdeaListView()
    }
}
#endif
