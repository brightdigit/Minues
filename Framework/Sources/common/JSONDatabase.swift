//
//  File.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation

struct InvalidDatabaseFileError : Error {
  
}

struct JSONDatabase : DatabaseProtocol {
  let ideas: [IdeaProtocol]
  
  class BundleAccessor {
    
  }
  //static let shared : DatabaseProtocol  = try! Database()
  static let jsonDecoder = JSONDecoder()
  
  
  internal init () throws {
    
    guard let bucketItemsURL = Bundle(for: BundleAccessor.self).url(forResource: "bucketItems", withExtension: "json") else {
      throw InvalidDatabaseFileError()
    }
    
    let data = try Data(contentsOf: bucketItemsURL)
    let sourceIdeas = try JSONDatabase.jsonDecoder.decode([Idea].self, from: data)
    self.ideas = [Idea](sourceIdeas.shuffled()[0...20])
  }
  
  func ideas(_ completion: @escaping (Result<[IdeaProtocol], Error>) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
      completion(.success(self.ideas))
    }
  }
}
