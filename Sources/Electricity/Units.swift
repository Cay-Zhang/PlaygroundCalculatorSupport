//
//  Units.swift
//  
//
//  Created by Cay Zhang on 2020/6/8.
//

import Foundation

public extension UnitElectricCharge {
    static var microCoulombs: UnitElectricCharge = UnitElectricCharge(symbol: "μC", converter: UnitConverterLinear(coefficient: 1E-6))
    static var nanocoulombs: UnitElectricCharge = UnitElectricCharge(symbol: "nC", converter: UnitConverterLinear(coefficient: 1E-9))
}

public class UnitCapacitance : Dimension {
    public static var farads = UnitCapacitance(symbol: "F", converter: UnitConverterLinear(coefficient: 1.0))
    public static var microfarads = UnitCapacitance(symbol: "μF", converter: UnitConverterLinear(coefficient: 1E-6))
    public static var nanofarads = UnitCapacitance(symbol: "nF", converter: UnitConverterLinear(coefficient: 1E-9))
    public override class func baseUnit() -> Self { Self.farads as! Self }
}

infix operator <| : BitwiseShiftPrecedence
public func <| <U: Unit> (value: Double, unit: U) -> Measurement<U> {
    Measurement(value: value, unit: unit)
}

infix operator |> : NilCoalescingPrecedence
public func |> <U: Dimension> (measurement: Measurement<U>, unit: U) -> Measurement<U> {
    measurement.converted(to: unit)
}
