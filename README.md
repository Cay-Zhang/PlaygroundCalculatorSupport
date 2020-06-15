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
### Vectors
```swift
// Cartesian Coordinates <x, y>
let vec_a = 3.0.cm ++ 4.0.cm  // <3.0 cm, 4.0 cm>
vec_a.magnitude  // 5.0 cm
vec_a.angle  // 53.1301 °

// Polar Coordinates <r, θ>
let vec_b = sqrt(2).m ++ 135.0.degrees  // <-1.0 m, 1.0 m>

// Dot Product
vec_a * vec_b  // 0.01 m
```
