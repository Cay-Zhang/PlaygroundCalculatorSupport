//
//  ElectricFlux.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation
import PlaygroundCalculatorSupport

public func electricFlux(enclosedCharge: Measurement<UnitElectricCharge>) -> Measurement<UnitElectricFlux> {
    (enclosedCharge.baseValue / 𝝴).withBaseUnit(UnitElectricFlux.self)
}
