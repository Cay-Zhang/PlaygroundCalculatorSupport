//
//  VectorMeasurement.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/9.
//

import Foundation

public protocol VectorMeasurement: AdditiveArithmetic {
    associatedtype UnitType : Dimension
    var magnitude: Measurement<UnitType> { get }
    func withMagnitude(_ newMagnitude: Measurement<UnitType>) -> Self
}

public struct VectorMeasurement2<UnitType: Dimension> : VectorMeasurement, CustomStringConvertible {
    public var x: Measurement<UnitType>
    public var y: Measurement<UnitType>
    
    public init(_ x: Measurement<UnitType>, _ y: Measurement<UnitType>) {
        self.x = x
        self.y = y
    }
    
    public init(magnitude: Measurement<UnitType>, angle: Measurement<UnitAngle>) {
        let angleInRads = (angle |> UnitAngle.radians).value
        self.x = Measurement<UnitType>(value: magnitude.value * cos(angleInRads), unit: magnitude.unit)
        self.y = Measurement<UnitType>(value: magnitude.value * sin(angleInRads), unit: magnitude.unit)
    }
    
    public var magnitude: Measurement<UnitType> {
        Measurement<UnitType>(
            value: (pow(x.baseValue, 2) + pow(y.baseValue, 2)).squareRoot(),
            unit: UnitType.baseUnit()
        )
    }
    
    public var angle: Measurement<UnitAngle> {
        (atan(y.baseValue / x.baseValue) + (x.baseValue < 0.0 ? Double.pi : 0.0)).rads
    }
    
    public static var zero: VectorMeasurement2<UnitType> {
        VectorMeasurement2<UnitType>(0.0 <| UnitType.baseUnit(), 0.0 <| UnitType.baseUnit())
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        VectorMeasurement2<UnitType>(
            lhs.x + rhs.x,
            lhs.y + rhs.y
        )
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        VectorMeasurement2<UnitType>(
            lhs.x - rhs.x,
            lhs.y - rhs.y
        )
    }
    
    public func withMagnitude(_ newMagnitude: Measurement<UnitType>) -> Self {
        let multiplier = newMagnitude.baseValue / self.magnitude.baseValue
        var copy = self
        copy.x.value *= multiplier
        copy.y.value *= multiplier
        return copy
    }
    
    public var description: String {
        "<\(x), \(y)>"
    }
}

precedencegroup DimensionalityOperationPrecedence {
    higherThan: CastingPrecedence
    lowerThan: AdditionPrecedence
    associativity: left
    assignment: false
}

infix operator ++ : DimensionalityOperationPrecedence

public extension Measurement where UnitType : Dimension {
    static func ++ (x: Self, y: Self) -> VectorMeasurement2<UnitType> {
        VectorMeasurement2<UnitType>(x, y)
    }
    
    static func ++ (magnitude: Self, angle: Measurement<UnitAngle>) -> VectorMeasurement2<UnitType> {
        VectorMeasurement2<UnitType>(magnitude: magnitude, angle: angle)
    }
}
