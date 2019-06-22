//
//  DatabaseSyncProtocol.swift
//  therbe
//
//  Created by Leo Dion on 6/22/19.
//

import Foundation
protocol DatabaseSyncProtocol {
  var ideas : Result<[IdeaProtocol], Error> { get }
}
