//
//  ElectricCharge.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/10.
//

import Foundation
import PlaygroundCalculatorSupport

public func electricCharge(producingFlux flux: Measurement<UnitElectricFlux>) -> Measurement<UnitElectricCharge> {
    (𝝴 * flux.baseValue).withBaseUnit(UnitElectricCharge.self)
}
