//
//  SwiftUIView.swift
//  therbe
//
//  Created by Leo Dion on 6/16/19.
//

import SwiftUI



struct IdeaRowView : View {
  var idea : IdeaProtocol
  var body: some View {
    
    HStack {
      Text(self.idea.title)
    }
  }
}
#if DEBUG

struct IdeaRowView_Previews : PreviewProvider {
  static var previews: some View {
    Group{
      IdeaRowView(idea:  Database.shared.ideas[0])
        .previewLayout(.fixed(width: 300, height: 70))
      IdeaRowView(idea:  Database.shared.ideas[1])
        .previewLayout(.fixed(width: 300, height: 70))
    }
  }
}
#endif
