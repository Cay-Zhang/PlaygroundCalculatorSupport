//
//  Angle.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/14.
//

import Foundation

public typealias Angle = Measurement<UnitAngle>

public extension Angle {
    static let straight: Angle = Double.pi.rads
    static func arctan(_ tangent: Double) -> Angle { atan(tangent).rads }
}
