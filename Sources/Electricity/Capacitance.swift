//
//  Capacitance.swift
//  Electricity
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation
import PlaygroundCalculatorSupport

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

public func capacitance(series Cs: Measurement<UnitCapacitance>...) -> Measurement<UnitCapacitance> {
    Measurement<UnitCapacitance>(
        value: capacitance(series: Cs.map(\.baseValue)),
        unit: UnitCapacitance.baseUnit()
    )
}

public func capacitance(parallel Cs: Measurement<UnitCapacitance>...) -> Measurement<UnitCapacitance> {
    Cs.reduce(0 <| UnitCapacitance.farads, +)
}
