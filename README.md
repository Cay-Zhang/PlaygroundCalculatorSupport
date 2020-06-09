# PlaygroundCalculatorSupport
Turn your Swift Playground into an interactive calculator, with **units** and **vector** support.
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
