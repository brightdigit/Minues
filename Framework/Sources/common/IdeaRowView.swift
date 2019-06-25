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
      Text(self.idea.name).layoutPriority(-200)
      if editMode {
        Button(action: {
          print(self.idea.name)
        }){
          HStack{
            ZStack{
              RoundedRectangle(cornerRadius: 10.0).foregroundColor(.red)
              Text("Project").color(.white).padding(5.0)
            }
            ZStack{
              RoundedRectangle(cornerRadius: 10.0).foregroundColor(.red)
              Text("Habit").color(.white)
            }
          }
        }
      }
    }
  }
}
#if DEBUG

struct IdeaRowView_Previews : PreviewProvider {
  static var previews: some View {
    Group{
      IdeaRowView(idea:  Idea(id: UUID(), name: "Lorem Ipsum Lorem Ipsum Lorem Ipsum"), editMode: true)
        .previewLayout(.fixed(width: 300, height: 70))
    }
  }
}
#endif
