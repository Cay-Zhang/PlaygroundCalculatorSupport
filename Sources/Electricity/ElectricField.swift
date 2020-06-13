//
//  ElectricField.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation
import PlaygroundCalculatorSupport

public func electricField(byParticle Q: Measurement<UnitElectricCharge>, _ r: Measurement<UnitLength>) -> Measurement<UnitElectricField> {
    (k * Q.baseValue / r.baseValue / r.baseValue) <| UnitElectricField.baseUnit()
}

public func electricField(byParticle Q: Measurement<UnitElectricCharge>, relativePosition: VectorMeasurement2<UnitLength>) -> VectorMeasurement2<UnitElectricField> {
    VectorMeasurement2<UnitElectricField>(magnitude: electricField(byParticle: Q, relativePosition.magnitude), angle: relativePosition.angle)
}

public func electricField(byInfiniteLineOfChargeWithDensity chargeDensity: Measurement<UnitQuotient<UnitElectricCharge, UnitLength>>, _ distance: Measurement<UnitLength>) -> Measurement<UnitElectricField> {
    (2.0 * k * chargeDensity.baseValue / distance.baseValue).withBaseUnit(UnitElectricField.self)
}

public func electricField(byInfiniteSheetOfChargeWithDensity chargeDensity: Measurement<UnitQuotient<UnitElectricCharge, UnitArea>>) -> Measurement<UnitElectricField> {
    (chargeDensity.baseValue / 2.0 / 𝝴).withBaseUnit(UnitElectricField.self)
}

public func electricPotential(byParticle Q: Measurement<UnitElectricCharge>, _ r: Measurement<UnitLength>) -> Measurement<UnitElectricPotentialDifference> {
    (k * Q.baseValue / r.baseValue).withBaseUnit(UnitElectricPotentialDifference.self)
}
