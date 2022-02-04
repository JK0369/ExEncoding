//
//  MyModel.swift
//  ExEncoding
//
//  Created by Jake.K on 2022/02/04.
//

import Foundation

struct MyModel {
  enum CodingKeys: String, CodingKey {
    case userID = "user_id"
    case blogInfo = "blog_info"
  }
  enum BlogInfoKeys: String, CodingKey {
    case name
  }
  enum NameKeys: String, CodingKey {
    case first
    case second
  }
  var userID: String?
  var blogName: String?
}

extension MyModel: Encodable {
  func encode(to encoder: Encoder) throws {
    var containerKeys = encoder.container(keyedBy: CodingKeys.self)
    try containerKeys.encode(self.userID, forKey: .userID)
    
    var blogInfoKeys = containerKeys.nestedContainer(keyedBy: BlogInfoKeys.self, forKey: .blogInfo)
    var nameKeys = blogInfoKeys.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
    try nameKeys.encode(self.blogName, forKey: .first)
  }
}
