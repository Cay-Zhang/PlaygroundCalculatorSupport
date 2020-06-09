import Foundation

public func maxErrorPercentage(between a: Double, _ b: Double) -> Double {
    abs((a - b) / min(a, b)) * 100
}

public func maxErrorPercentage<U: Dimension>(between a: Measurement<U>, _ b: Measurement<U>, in unit: U = U.baseUnit()) -> Double {
    maxErrorPercentage(between: (a |> unit).value, (b |> unit).value)
}
