import Foundation

public extension Measurement {
    static func * (current: Measurement<UnitElectricCurrent>, voltage: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitPower> {
        (current.baseValue * voltage.baseValue) <| .baseUnit()
    }
    
    static func * (voltage: Measurement<UnitElectricPotentialDifference>, current: Measurement<UnitElectricCurrent>) -> Measurement<UnitPower> {
        (current.baseValue * voltage.baseValue) <| .baseUnit()
    }
    
    static func / (lhs: Measurement<UnitPower>, rhs: Measurement<UnitElectricPotentialDifference>) -> Measurement<UnitElectricCurrent> {
        (lhs.baseValue / rhs.baseValue) <| .baseUnit()
    }
    
    static func / (lhs: Measurement<UnitPower>, rhs: Measurement<UnitElectricCurrent>) -> Measurement<UnitElectricPotentialDifference> {
        (lhs.baseValue / rhs.baseValue) <| .baseUnit()
    }
}
