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
  
  
  var body: some View {
    Group(){
      
      self.model.ideas.map{
        result in
        ViewBuilder.buildEither(first: ActivityIndicator(style: .medium))
        
//        ViewBuilder.buildEither(first:
//                  NavigationView {
//                    List(ideas.identified(by: \.id)){
//                      IdeaRowView(idea: $0)
//                      }.navigationBarTitle(Text("Ideas"))
//                  }.transition(.opacity)

        //)
        } ?? ViewBuilder.buildEither(second: ActivityIndicator(style: .large).onAppear(perform: {
          self.model.fetch()
        }).transition(.opacity))
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
