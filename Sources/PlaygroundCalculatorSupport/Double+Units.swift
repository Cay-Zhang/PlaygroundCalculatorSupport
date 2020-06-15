import Foundation

public extension Double {
    var cm³: Measurement<UnitVolume> { self.withUnit(UnitVolume.cubicCentimeters) }
    var m³: Measurement<UnitVolume> { self.withUnit(UnitVolume.cubicMeters) }
    
    var cm²: Measurement<UnitArea> { self <| UnitArea.squareCentimeters }
    var m²: Measurement<UnitArea> { self <| UnitArea.squareMeters }
    
    var nm: Measurement<UnitLength> { self.withUnit(UnitLength.nanometers) }
    var mm: Measurement<UnitLength> { self.withUnit(UnitLength.millimeters) }
    var cm: Measurement<UnitLength> { self <| UnitLength.centimeters }
    var m: Measurement<UnitLength> { self <| UnitLength.meters }
    
    var degrees: Measurement<UnitAngle> { self <| UnitAngle.degrees }
    var rads: Measurement<UnitAngle> { self <| UnitAngle.radians }
    
    var W: Measurement<UnitPower> { self <| UnitPower.watts }
}
