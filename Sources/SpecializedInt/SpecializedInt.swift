import Foundation

public protocol SpecializedInt: SignedInteger, Codable where Words == Int.Words, Magnitude == Int.Magnitude, IntegerLiteralType == Int.IntegerLiteralType {
    var rawIntValue: Int { get set }

    init(rawIntValue: Int)
}

public extension SpecializedInt {
    static func + (lhs: Self, rhs: Self) -> Self {
        Self(rawIntValue: lhs.rawIntValue + rhs.rawIntValue)
    }

    static func - (lhs: Self, rhs: Self) -> Self {
        Self(rawIntValue: lhs.rawIntValue - rhs.rawIntValue)
    }

    static func * (lhs: Self, rhs: Self) -> Self {
        Self(rawIntValue: lhs.rawIntValue * rhs.rawIntValue)
    }

    static func / (lhs: Self, rhs: Self) -> Self {
        Self(rawIntValue: lhs.rawIntValue / rhs.rawIntValue)
    }

    static func % (lhs: Self, rhs: Self) -> Self {
        Self(rawIntValue: lhs.rawIntValue % rhs.rawIntValue)
    }

    static func %= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue %= rhs.rawIntValue
    }

    static func &= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue &= rhs.rawIntValue
    }

    static func *= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue *= rhs.rawIntValue
    }

    static func |= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue |= rhs.rawIntValue
    }

    static func ^= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue ^= rhs.rawIntValue
    }

    static func /= (lhs: inout Self, rhs: Self) {
        lhs.rawIntValue /= rhs.rawIntValue
    }

    static func <<= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawIntValue <<= rhs
    }

    static func >>= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawIntValue >>= rhs
    }

    static prefix func ~ (x: Self) -> Self {
        Self.init(rawIntValue: ~x.rawIntValue)
    }

    init?<T>(exactly source: T) where T : BinaryFloatingPoint {
        if let rawIntValue = Int.init(exactly: source) {
            self.init(rawIntValue: rawIntValue)
        } else {
            return nil
        }
    }

    init<T>(_ source: T) where T : BinaryFloatingPoint {
        self.init(rawIntValue: .init(source))
    }

    init?<T>(exactly source: T) where T : BinaryInteger {
        if let rawIntValue = Int.init(exactly: source) {
            self.init(rawIntValue: rawIntValue)
        } else {
            return nil
        }
    }

    init<T>(_ source: T) where T : BinaryInteger {
        self.init(rawIntValue: Int.init(source))
    }

    init(integerLiteral value: Int.IntegerLiteralType) {
        self.init(rawIntValue: value)
    }

    init<T>(clamping source: T) where T : BinaryInteger {
        self.init(rawIntValue: Int.init(clamping: source))
    }

    init<T>(truncatingIfNeeded source: T) where T : BinaryInteger {
        self.init(rawIntValue: Int.init(truncatingIfNeeded: source))
    }

    var bitWidth: Int {
        rawIntValue.bitWidth
    }

    var trailingZeroBitCount: Int {
        rawIntValue.trailingZeroBitCount
    }

    var words: Int.Words {
        rawIntValue.words
    }

    var magnitude: Int.Magnitude {
        rawIntValue.magnitude
    }
}
