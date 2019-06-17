//
//  ActivityIndicator.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    uiView.startAnimating()
  }
}
