//
//  Length.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation

public func circumference(circle radius: Measurement<UnitLength>) -> Measurement<UnitLength> {
    (2.0 * Double.pi * radius.baseValue).withBaseUnit(UnitLength.self)
}
