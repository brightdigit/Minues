//
//  ProjectRowView.swift
//  therbe
//
//  Created by Leo Dion on 6/21/19.
//

import SwiftUI

struct ProjectRowView : View {
  var project : ProjectProtocol
  var body: some View {
    
    HStack {
      Text(self.project.name)
    }
  }
}

#if DEBUG
struct ProjectRowView_Previews : PreviewProvider {
  static var previews: some View {
    ProjectRowView(project: Project(id: UUID(), name: "Lorem Ipsum", ideaId: UUID()))
  }
}
#endif
