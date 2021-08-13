//
//  Dictionary+Extension.swift
//  DodiUI
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  public var toStringWithAny: [String: Any] {
    return self.reduce([:], { result, item -> [String: Any] in
      var mutableResult: [String: Any] = result
      mutableResult[item.key.rawValue] = item.value
      return mutableResult
    })
  }
}
