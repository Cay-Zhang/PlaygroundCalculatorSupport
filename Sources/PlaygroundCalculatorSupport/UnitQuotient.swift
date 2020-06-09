import Foundation

public class UnitQuotient<A: Dimension, B: Dimension> : Dimension {
    
    let unitA: A
    let unitB: B
    
    public init(_ a: A, dividedBy b: B) {
        unitA = a
        unitB = b
        
        let coefficientA = (a.converter as! UnitConverterLinear).coefficient
        let coefficientB = (b.converter as! UnitConverterLinear).coefficient
        
        super.init(symbol: "\(a.symbol)/\(b.symbol)", converter: UnitConverterLinear(coefficient: coefficientA / coefficientB))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override class func baseUnit() -> Self {
        UnitQuotient(A.baseUnit(), dividedBy: B.baseUnit()) as! Self
    }
}

public func / <A: Dimension, B: Dimension> (a: A, b: B) -> UnitQuotient<A, B> {
    UnitQuotient<A, B>(a, dividedBy: b)
}

public extension Measurement {
    static func * <A: Dimension, B: Dimension> (quotient: Measurement<UnitQuotient<A, B>>, factor: Measurement<B>) -> Measurement<A> {
        Measurement<A>(
            value: quotient.baseValue * factor.baseValue,
            unit: A.baseUnit()
        )
    }
    
    static func * <A: Dimension, B: Dimension> (factor: Measurement<B>, quotient: Measurement<UnitQuotient<A, B>>) -> Measurement<A> {
        Measurement<A>(
            value: quotient.baseValue * factor.baseValue,
            unit: A.baseUnit()
        )
    }
}
