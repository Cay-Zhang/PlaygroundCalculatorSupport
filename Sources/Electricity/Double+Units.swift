//
//  Double+Units.swift
//
//
//  Created by Cay Zhang on 2020/6/8.
//

import Foundation
import PlaygroundCalculatorSupport

public extension Double {
    var C: Measurement<UnitElectricCharge> { self <| UnitElectricCharge.coulombs }
    var μC: Measurement<UnitElectricCharge> { self <| UnitElectricCharge.microCoulombs }
    var nC: Measurement<UnitElectricCharge> { self <| UnitElectricCharge.nanocoulombs }
    
    var F: Measurement<UnitCapacitance> { self <| UnitCapacitance.farads }
    var μF: Measurement<UnitCapacitance> { self <| UnitCapacitance.microfarads }
    var nF: Measurement<UnitCapacitance> { self <| UnitCapacitance.nanofarads }
    
    var V: Measurement<UnitElectricPotentialDifference> { self <| UnitElectricPotentialDifference.volts }
    
    var Ω: Measurement<UnitElectricResistance> { self <| UnitElectricResistance.ohms }
    var mΩ: Measurement<UnitElectricResistance> { self <| UnitElectricResistance.milliohms }
    var μΩ: Measurement<UnitElectricResistance> { self <| UnitElectricResistance.microohms }
    
    var A: Measurement<UnitElectricCurrent> { self <| UnitElectricCurrent.amperes }
    var mA: Measurement<UnitElectricCurrent> { self <| UnitElectricCurrent.milliamperes }
    var μA: Measurement<UnitElectricCurrent> { self <| UnitElectricCurrent.microamperes }
}
