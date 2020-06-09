import Foundation

public extension Double {
    var cm²: Measurement<UnitArea> { self <| UnitArea.squareCentimeters }
    
    var cm: Measurement<UnitLength> { self <| UnitLength.centimeters }
    var m: Measurement<UnitLength> { self <| UnitLength.meters }
    
    var degrees: Measurement<UnitAngle> { self <| UnitAngle.degrees }
    var rads: Measurement<UnitAngle> { self <| UnitAngle.radians }
    
    var W: Measurement<UnitPower> { self <| UnitPower.watts }
}
