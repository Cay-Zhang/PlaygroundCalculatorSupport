//
//  ElectricField.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation
import PlaygroundCalculatorSupport

func electricField(byParticle Q: Measurement<UnitElectricCharge>, _ r: Measurement<UnitLength>) -> Measurement<UnitElectricField> {
    (k * Q.baseValue / r.baseValue / r.baseValue) <| UnitElectricField.baseUnit()
}

func electricField(byParticle Q: Measurement<UnitElectricCharge>, relativePosition: VectorMeasurement2<UnitLength>) -> VectorMeasurement2<UnitElectricField> {
    VectorMeasurement2<UnitElectricField>(magnitude: electricField(byParticle: Q, relativePosition.magnitude), angle: relativePosition.angle)
}
