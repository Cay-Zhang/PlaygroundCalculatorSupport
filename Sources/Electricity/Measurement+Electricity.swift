//
//  Measurement+Electricity.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation
import PlaygroundCalculatorSupport

// MARK: - Capacitance
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
}

// MARK: - Electric Potential Energy
public extension Measurement {
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

// MARK: - Power
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
