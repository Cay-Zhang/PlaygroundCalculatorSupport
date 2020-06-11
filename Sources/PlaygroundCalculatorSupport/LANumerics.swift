//
//  LANumerics.swift
//  PlaygroundCalculatorSupport
//
//  Created by Cay Zhang on 2020/6/11.
//

import Foundation
import LANumerics

public extension Matrix where Element == Double {
    static func withBaseValue<U: Dimension>(_ matrix: [[Measurement<U>]]) -> Matrix<Double> {
        Matrix<Double>(rows: matrix.map { $0.map(\.baseValue) })
    }
    
    func solve<U: Dimension>(withBaseValue rhs: Array<Measurement<U>>) -> Vector<Double> {
        solve(rhs.map(\.baseValue))!
    }
}
