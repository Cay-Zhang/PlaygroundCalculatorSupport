import Foundation

public extension Measurement where UnitType : Dimension {
    var baseValue: Double { self.converted(to: UnitType.baseUnit()).value }
    
    static prefix func - (measurement: Self) -> Self {
        var copy = measurement
        copy.value *= -1.0
        return copy
    }
    
    static func * (lhs: Measurement<UnitLength>, rhs: Measurement<UnitLength>) -> Measurement<UnitArea> {
        (lhs.baseValue * rhs.baseValue).withBaseUnit(UnitArea.self)
    }
    
    static func / (lhs: Self, rhs: Self) -> Double {
        lhs.baseValue / rhs.baseValue
    }
}

public extension Double {
    func withUnit<U: Unit>(_ unit: U) -> Measurement<U> {
        return Measurement<U>(value: self, unit: unit)
    }
    
    func withBaseUnit<U: Dimension>(_ unitType: U.Type) -> Measurement<U> {
        return Measurement<U>(value: self, unit: U.baseUnit())
    }
}

infix operator <| : BitwiseShiftPrecedence
public func <| <U: Unit> (value: Double, unit: U) -> Measurement<U> {
    Measurement(value: value, unit: unit)
}

infix operator |> : NilCoalescingPrecedence
public func |> <U: Dimension> (measurement: Measurement<U>, unit: U) -> Measurement<U> {
    measurement.converted(to: unit)
}
