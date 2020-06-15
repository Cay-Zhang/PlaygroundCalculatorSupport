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
    
    static func between<U: Dimension>(_ a⃗: VectorMeasurement2<U>, _ b⃗: VectorMeasurement2<U>) -> Angle {
        acos((a⃗ * b⃗).baseValue / a⃗.magnitude.baseValue / b⃗.magnitude.baseValue).rads
    }
    
    var sine: Double {
        sin(self.converted(to: .radians).value)
    }
    
    var cosine: Double {
        cos(self.converted(to: .radians).value)
    }
}
