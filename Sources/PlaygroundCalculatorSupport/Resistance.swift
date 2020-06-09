import Foundation

public func resistance(parallel Rs: [Double]) -> Double {
    1.0 / (Rs.map { 1.0 / $0 }.reduce(into: 0, +=))
}

public func resistance(parallel Rs: Measurement<UnitElectricResistance>...) -> Measurement<UnitElectricResistance> {
    resistance(parallel: Rs.map(\.baseValue)) <| .baseUnit()
}

public func resistance(series Rs: Measurement<UnitElectricResistance>...) -> Measurement<UnitElectricResistance> {
    Rs.reduce(0.0 <| UnitElectricResistance.baseUnit(), +)
}

public extension Measurement {
    static func * (current: Measurement<UnitElectricCurrent>, resistance: Measurement<UnitElectricResistance>) -> Measurement<UnitElectricPotentialDifference> {
        (current.baseValue * resistance.baseValue) <| .baseUnit()
    }
    
    static func * (resistance: Measurement<UnitElectricResistance>, current: Measurement<UnitElectricCurrent>) -> Measurement<UnitElectricPotentialDifference> {
        (current.baseValue * resistance.baseValue) <| .baseUnit()
    }
    
    static func / (lhs: Measurement<UnitElectricPotentialDifference>, rhs: Measurement<UnitElectricResistance>) -> Measurement<UnitElectricCurrent> {
        (lhs.baseValue / rhs.baseValue) <| .baseUnit()
    }
    
    static func / (lhs: Measurement<UnitElectricPotentialDifference>, rhs: Measurement<UnitElectricCurrent>) -> Measurement<UnitElectricResistance> {
        (lhs.baseValue / rhs.baseValue) <| .baseUnit()
    }
}
