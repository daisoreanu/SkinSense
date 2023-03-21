//
//  EncodableExtension.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
