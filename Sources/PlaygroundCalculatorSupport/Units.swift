//
//  Units.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation

public final class UnitForce : Dimension {
    public static let newtons = UnitForce(symbol: "N", converter: UnitConverterLinear(coefficient: 1))
    public override class func baseUnit() -> Self {
        Self.newtons as! Self
    }
}
