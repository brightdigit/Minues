//
//  ContentView.swift
//  minues-ios-app
//
//  Created by Leo Dion on 6/4/19.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            HStack {
                
                Text("Hello World")
            }
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
