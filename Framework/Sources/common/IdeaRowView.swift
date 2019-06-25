//
//  SwiftUIView.swift
//  therbe
//
//  Created by Leo Dion on 6/16/19.
//

import SwiftUI



struct IdeaRowView : View {
  var idea : IdeaProtocol
  var editMode : Bool = false
  var body: some View {
    
    HStack {
      Text(self.idea.name)
      if editMode {
        Button(action: {
          print(self.idea.name)
        }){
          Text("Project")
        }
      }
    }
  }
}
#if DEBUG

struct IdeaRowView_Previews : PreviewProvider {
  static var previews: some View {
    Group{
      IdeaRowView(idea:  Idea(id: UUID(), name: "test"))
        .previewLayout(.fixed(width: 300, height: 70))
    }
  }
}
#endif
