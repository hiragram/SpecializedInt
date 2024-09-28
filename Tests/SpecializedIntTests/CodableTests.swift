//
//  File.swift
//  SpecializedInt
//
//  Created by Yuya Hirayama on 2024/09/28.
//

import Foundation
import Testing
@testable import SpecializedInt

struct DrinkPrice: SpecializedInt {
    var rawIntValue: Int

    init(rawIntValue: Int) {
        self.rawIntValue = rawIntValue
    }
}

struct JSON: Codable {
    var coffeePrice: DrinkPrice
}

extension SpecializedIntTests {
    @Suite("Codable") struct CodableTests {
        @Test("Encode") func encode() throws {
            let json = try JSONEncoder().encode(
                JSON.init(
                    coffeePrice: 390
                )
            )

            let actual = try JSONSerialization.jsonObject(with: json) as! [String: Any]
            let expected: [String: Any] = [
                "coffeePrice": 390
            ]

            #expect(actual.keys == expected.keys)

            let actualPrice = try #require(actual["coffeePrice"] as? Int)
            let expectedPrice = try #require(expected["coffeePrice"] as? Int)

            #expect(actualPrice == expectedPrice)
        }

        @Test("Decode") func decode() throws {
            let actual = try JSONDecoder().decode(JSON.self, from: #require(#"{ "coffeePrice": 390 }"#.data(using: .utf8)))
            let expected = JSON.init(coffeePrice: 390)

            #expect(actual.coffeePrice.rawIntValue == expected.coffeePrice.rawIntValue)
        }
    }
}
