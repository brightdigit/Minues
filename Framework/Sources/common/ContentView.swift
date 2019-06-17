//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI



struct ContentView : View {
  var body: some View {
    NavigationView {
      List(Database.shared.bucketItems) { item in
        BucketItemRow(item: item)
        }
        .navigationBarTitle(Text("Landmarks"))
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
