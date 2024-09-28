import Testing
@testable import SpecializedInt

struct FruitAmount: SpecializedInt {
    var rawIntValue: Int

    init(rawIntValue: Int) {
        self.rawIntValue = rawIntValue
    }
}

@Suite struct SpecializedIntTests {
    static let arguments: [Int] = [-100, -1, 0, 1, 100]

    @Suite("Operator") struct OperatorTests {
        @Test("+", arguments: arguments) func additionOperator(arg: Int) {
            let actual = FruitAmount(rawIntValue: arg) + FruitAmount(rawIntValue: 5)
            let expected = arg + 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("-", arguments: arguments) func subtractionOperator(arg: Int) {
            let actual = FruitAmount(rawIntValue: arg) - FruitAmount(rawIntValue: 5)
            let expected = arg - 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("*", arguments: arguments) func multiplicationOperator(arg: Int) {
            let actual = FruitAmount(rawIntValue: arg) * FruitAmount(rawIntValue: 5)
            let expected = arg * 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("/", arguments: arguments) func divisionOperator(arg: Int) {
            let actual = FruitAmount(rawIntValue: arg) / FruitAmount(rawIntValue: 5)
            let expected = arg / 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("%", arguments: arguments) func remainderOperator(arg: Int) {
            let actual = FruitAmount(rawIntValue: arg) % FruitAmount(rawIntValue: 5)
            let expected = arg % 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("~", arguments: arguments) func bitwiseNOTOperator(arg: Int) {
            let actual = ~FruitAmount(rawIntValue: arg)
            let expected = ~arg

            #expect(actual.rawIntValue == expected)
        }
    }

    @Suite("Assignment operator") struct AssignmentOperatorTests {
        @Test("%=", arguments: arguments) func remainderAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual %= 5
            var expected = arg
            expected %= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("&=", arguments: arguments) func bitwiseANDAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual &= 5
            var expected = arg
            expected &= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("*=", arguments: arguments) func multiplicationAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual *= 5
            var expected = arg
            expected *= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("|=", arguments: arguments) func bitwiseORAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual |= 5
            var expected = arg
            expected |= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("^=", arguments: arguments) func bitwiseXORAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual ^= 5
            var expected = arg
            expected ^= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("/=", arguments: arguments) func divisionAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual /= 5
            var expected = arg
            expected /= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test("<<=", arguments: arguments) func bitwiseLeftShiftAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual <<= 5
            var expected = arg
            expected <<= 5

            #expect(actual.rawIntValue == expected)
        }

        @Test(">>=", arguments: arguments) func bitwiseRightShiftAssignmentOperator(arg: Int) {
            var actual = FruitAmount(rawIntValue: arg)
            actual >>= 5
            var expected = arg
            expected >>= 5

            #expect(actual.rawIntValue == expected)
        }
    }
}
