# PlaygroundCalculatorSupport
Turn your Swift Playground into an interactive calculator, with **units** and **vector** support.


## Features
- [x] Based on **Foundation**'s highly extensible unit system
- [x] Integrate units into calculations in a quick and concise way
- [x] Easy-to-use vector support (also with units)
- [x] Use [**LANumerics**](https://github.com/phlegmaticprogrammer/LANumerics) to solve linear equations

## Installation
**PlaygroundCalculatorSupport** is available as a Swift Package. However, currently there's no built-in way to integrate a Swift Package into a Swift Playground inside Xcode. It is recommended to use [**Arena**](https://github.com/finestructure/Arena) to do so.
```
arena -n "PlaygroundCalculator" Cay-Zhang/PlaygroundCalculatorSupport@branch:master
```
## Basic Support
Under Module **PlaygroundCalculatorSupport**.
### Calculation with Units
```swift
3.0.cm + 4.m  // 4.03 m
3.cm / 4.cm  // 0.75
3.0 * 4.m³  // 12.0 m³

3.m * 24.degrees  // Error

12.0.cm.converted(to: .meters)  // 0.12 m
30.0.degrees.converted(to: .revolutions)  // 0.08333 rev

// Length -> Area -> Volume
let a = 8.7.cm, b = 7.3.cm
let A_rectangle = a * b  // 0.00635 m²
A_rectangle.converted(to: .squareInches)  // 9.84407 in²
let V_cuboid = A_rectangle * 7.m  // 0.04446 m³
```

```swift
import PlaygroundCalculatorSupport
import Electricity

// Circuit 1 with Resistors and a Battery
autoreleasepool {
    let V = 12.0 .V
    let R1 = 51 .Ω, R2 = 100 .Ω, R3 = 152 .Ω, R4 = 89 .Ω

    let R13 = resistance(series: R1, R3)
    let V13 = V
    let I13 = V13 / R13

    let V1 = I13 * R1
    let V2 = V1

    let I2 = V2 / R2
    let Ix = I2

    let V3 = I13 * R3
    let Vx = V3

    let Rx = Vx / Ix

    let Rx_2 = R3 * I13 / Ix

    let Rx_3 = (R2.baseValue * R3.baseValue / R1.baseValue) <| UnitElectricResistance.baseUnit()
}

// Circuit 2 with Resistors and a Battery
autoreleasepool {
    let V = 12 .V
    let R1 = 66 .Ω, R2 = 109 .Ω, R3 = 40 .Ω, R4 = 83 .Ω, R5 = 66 .Ω
    
    let R23 = resistance(series: R2, R3)
    let Rab = resistance(parallel: R23, R4)
    let Rac = resistance(series: Rab, R1)
    
    let R = resistance(series: R5, Rac)
    let I = V / R
    
    let Vab = I * Rab
    let V23 = Vab
    let I23 = V23 / R23
}
```
