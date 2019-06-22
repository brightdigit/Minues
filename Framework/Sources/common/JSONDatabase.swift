//
//  File.swift
//  therbe
//
//  Created by Leo Dion on 6/17/19.
//

import Foundation

struct InvalidDatabaseFileError : Error {
  
}

struct JSONDatabase : DatabaseProtocol, DatabaseSyncProtocol {
  var ideas: Result<[IdeaProtocol], Error> {
    return .success( dataset.ideas)
  }
  
  var dataset : Dataset
  
  class BundleAccessor {
    
  }
  //static let shared : DatabaseProtocol  = try! Database()
  static let jsonDecoder = JSONDecoder()
  
  
  internal init () throws {
    
    guard let datasetURL = Bundle(for: BundleAccessor.self).url(forResource: "dataset", withExtension: "json") else {
      throw InvalidDatabaseFileError()
    }
    
    let data = try Data(contentsOf: datasetURL)
    self.dataset = try JSONDatabase.jsonDecoder.decode(Dataset.self, from: data)
  }
  
  func ideas(_ completion: @escaping (Result<[IdeaProtocol], Error>) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
      completion(.success(self.dataset.ideas))
    }
  }
  
  func projects(_ completion: @escaping (Result<[ProjectProtocol], Error>) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
      completion(.success(self.dataset.projects))
    }
  }
}
