import Foundation

public extension Measurement where UnitType : Dimension {
    var baseValue: Double { self.converted(to: UnitType.baseUnit()).value }
}

infix operator <| : BitwiseShiftPrecedence
public func <| <U: Unit> (value: Double, unit: U) -> Measurement<U> {
    Measurement(value: value, unit: unit)
}

infix operator |> : NilCoalescingPrecedence
public func |> <U: Dimension> (measurement: Measurement<U>, unit: U) -> Measurement<U> {
    measurement.converted(to: unit)
}
