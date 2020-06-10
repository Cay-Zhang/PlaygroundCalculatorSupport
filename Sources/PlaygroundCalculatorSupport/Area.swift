//
//  Area.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation

public func surfaceArea(sphere radius: Measurement<UnitLength>) -> Measurement<UnitArea> {
    (4.0 * Double.pi * radius.baseValue * radius.baseValue).withBaseUnit(UnitArea.self)
}
