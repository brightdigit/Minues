//
//  SwiftUIView.swift
//  therbe
//
//  Created by Leo Dion on 6/16/19.
//

import SwiftUI

struct InvalidDatabaseFileError : Error {
  
}

struct Database {
  class BundleAccessor {
    
  }
  static let shared = try! Database()
  static let jsonDecoder = JSONDecoder()
  let bucketItems : [BucketItem]
  
  private init () throws {
    
    guard let bucketItemsURL = Bundle(for: BundleAccessor.self).url(forResource: "bucketItems", withExtension: "json") else {
      throw InvalidDatabaseFileError()
    }
    
    let data = try Data(contentsOf: bucketItemsURL)
    let sourceBucketItems = try Database.jsonDecoder.decode([BucketItem].self, from: data)
    self.bucketItems = [BucketItem](sourceBucketItems.shuffled()[0...20])
  }
}

struct BucketItem : Codable, Identifiable {
  let id: UUID
  let title : String
  
  init(id: UUID, title: String) {
    self.id = id
    self.title = title
  }
}
struct BucketItemRow : View {
  var item : BucketItem
    var body: some View {
      
      HStack {
          Text(self.item.title)
      }
    }
}
#if DEBUG

struct BucketItem_Previews : PreviewProvider {
    static var previews: some View {
      Group{
        BucketItemRow(item:  Database.shared.bucketItems[0])
          .previewLayout(.fixed(width: 300, height: 70))
        BucketItemRow(item:  Database.shared.bucketItems[1])
          .previewLayout(.fixed(width: 300, height: 70))
      }
    }
}
#endif
