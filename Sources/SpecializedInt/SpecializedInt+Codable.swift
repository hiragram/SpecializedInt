//
//  File.swift
//  SpecializedInt
//
//  Created by Yuya Hirayama on 2024/09/28.
//

import Foundation

public extension SpecializedInt {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Int.self)
        self.init(rawIntValue: value)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawIntValue)
    }
}
