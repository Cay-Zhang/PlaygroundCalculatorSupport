import Foundation

public let 𝝴: Double = 8.853746277920301E-12

public func capacitance(parallel Cs: [Double]) -> Double {
    Cs.reduce(into: 0, +=)
}

public func capacitance(series Cs: [Double]) -> Double {
    1.0 / (Cs.map { 1.0 / $0 }.reduce(into: 0, +=))
}

public func capacitance(plates A: Double, _ d: Double) -> Double {
    𝝴 * A / d
}

public func capacitance(plates A: Measurement<UnitArea>, _ d: Measurement<UnitLength>) -> Measurement<UnitCapacitance> {
    Measurement<UnitCapacitance>(
        value: capacitance(plates: A.baseValue, d.baseValue),
        unit: UnitCapacitance.baseUnit()
    )
}

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

public extension Measurement {
    static func / (lhs: Measurement<UnitElectricCharge>, rhs: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitCapacitance> {
        Measurement<UnitCapacitance>(
            value: lhs.converted(to: .coulombs).value / rhs.converted(to: .volts).value,
            unit: UnitCapacitance.farads
        )
    }
    
    static func * (potentialDifference: Measurement<UnitElectricPotentialDifference>, capacitance: Measurement<UnitCapacitance>) -> Measurement<UnitElectricCharge> {
        Measurement<UnitElectricCharge>(
            value: potentialDifference.converted(to: .volts).value * capacitance.converted(to: .farads).value,
            unit: .coulombs
        )
    }
    
    static func * (capacitance: Measurement<UnitCapacitance>, potentialDifference: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitElectricCharge> {
        Measurement<UnitElectricCharge>(
            value: potentialDifference.converted(to: .volts).value * capacitance.converted(to: .farads).value,
            unit: .coulombs
        )
    }
    
    static func / (lhs: Measurement<UnitElectricCharge>, rhs: Measurement<UnitCapacitance>) -> Measurement<UnitElectricPotentialDifference> {
        Measurement<UnitElectricPotentialDifference>(
            value: lhs.baseValue / rhs.baseValue,
            unit: UnitElectricPotentialDifference.baseUnit()
        )
    }
    
    static func * (charge: Measurement<UnitElectricCharge>, potentialDifference: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitEnergy> {
        Measurement<UnitEnergy>(
            value: charge.baseValue * potentialDifference.baseValue,
            unit: UnitEnergy.baseUnit()
        )
    }
    static func * (potentialDifference: Measurement<UnitElectricPotentialDifference>, charge: Measurement<UnitElectricCharge>) -> Measurement<UnitEnergy> {
        Measurement<UnitEnergy>(
            value: charge.baseValue * potentialDifference.baseValue,
            unit: UnitEnergy.baseUnit()
        )
    }
}

public extension Measurement where UnitType : Dimension {
    var baseValue: Double { self.converted(to: UnitType.baseUnit()).value }
}

public struct _Unit<UnitType: Unit> {
    init(_ _unit: UnitType) { self._unit = _unit }
    let _unit: UnitType
    
    public static func / <A: Dimension, B: Dimension> (a: _Unit<A>, b: _Unit<B>) -> UnitQuotient<A, B> {
        a._unit / b._unit
    }
}

public struct u {
    public static let C = _Unit(UnitElectricCharge.coulombs)
    public static let μC: _Unit<UnitElectricCharge> = _Unit(UnitElectricCharge.microCoulombs)
    public static let F = _Unit(UnitCapacitance.farads)
    public static let μF = _Unit(UnitCapacitance.microfarads)
    public static let nF = _Unit(UnitCapacitance.nanofarads)
    public static let V = _Unit(UnitElectricPotentialDifference.volts)
    public static let cm² = _Unit(UnitArea.squareCentimeters)
    public static let cm = _Unit(UnitLength.centimeters)
    public static let m: _Unit<UnitLength> = _Unit(UnitLength.meters)
    public static let nC: _Unit<UnitElectricCharge> = _Unit(UnitElectricCharge.nanocoulombs)
}

public func capacitance(series Cs: Measurement<UnitCapacitance>...) -> Measurement<UnitCapacitance> {
    Measurement<UnitCapacitance>(
        value: capacitance(series: Cs.map(\.baseValue)),
        unit: UnitCapacitance.baseUnit()
    )
}

public func capacitance(parallel Cs: Measurement<UnitCapacitance>...) -> Measurement<UnitCapacitance> {
    Cs.reduce(0 <| UnitCapacitance.farads, +)
}

infix operator <| : BitwiseShiftPrecedence
public func <| <U: Unit> (value: Double, unit: U) -> Measurement<U> {
    Measurement(value: value, unit: unit)
}

public func <| <U: Unit> (value: Double, _unit: _Unit<U>) -> Measurement<U> {
    Measurement(value: value, unit: _unit._unit)
}

infix operator |> : NilCoalescingPrecedence
public func |> <U: Dimension> (measurement: Measurement<U>, unit: U) -> Measurement<U> {
    measurement.converted(to: unit)
}

public func |> <U: Dimension> (measurement: Measurement<U>, _unit: _Unit<U>) -> Measurement<U> {
    measurement.converted(to: _unit._unit)
}
