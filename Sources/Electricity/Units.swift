//
//  Units.swift
//  
//
//  Created by Cay Zhang on 2020/6/8.
//

import Foundation
import PlaygroundCalculatorSupport

public extension UnitElectricCharge {
    static var microcoulombs: UnitElectricCharge = UnitElectricCharge(symbol: "μC", converter: UnitConverterLinear(coefficient: 1E-6))
    static var nanocoulombs: UnitElectricCharge = UnitElectricCharge(symbol: "nC", converter: UnitConverterLinear(coefficient: 1E-9))
}

public class UnitCapacitance : Dimension {
    public static var farads = UnitCapacitance(symbol: "F", converter: UnitConverterLinear(coefficient: 1.0))
    public static var microfarads = UnitCapacitance(symbol: "μF", converter: UnitConverterLinear(coefficient: 1E-6))
    public static var nanofarads = UnitCapacitance(symbol: "nF", converter: UnitConverterLinear(coefficient: 1E-9))
    public override class func baseUnit() -> Self { Self.farads as! Self }
}

public typealias UnitElectricField = UnitQuotient<UnitForce, UnitElectricCharge>

public extension UnitElectricField {
    static var newtonsPerCoulomb: UnitElectricField = UnitForce.newtons / UnitElectricCharge.coulombs
}

public class UnitElectricFlux : Dimension {
    public static var newtonSquareMetersPerCoulomb = UnitElectricFlux(symbol: "N·m²/C", converter: UnitConverterLinear(coefficient: 1.0))
    
    public override class func baseUnit() -> Self { newtonSquareMetersPerCoulomb as! Self }
}
