//
//  Units.swift
//  TempConvertor
//
//  Created by Patryk Knopp on 10/10/2024.
//

import SwiftUI

enum Units: Double, CaseIterable, Identifiable {
    case kelvin = 1.0
    case celsius = 274.15
    case fahrenheit = 459.67
    case rankine = 1.8
    case reaumur = 0.8

    var name: String {
        switch self {
        case .kelvin:
            return "Kelvin"
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .rankine:
            return "Rankine"
        case .reaumur:
            return "Reaumur"
        }
    }
    
    var image: Image {
        switch self {
        case .kelvin:
            return Image(systemName: "k.circle")
        case .celsius:
            return Image(systemName: "degreesign.celsius")
        case .fahrenheit:
            return Image(systemName: "degreesign.farenheit")
        case .rankine:
            return Image(systemName: "k.square")
        case .reaumur:
            return Image(systemName: "thermometer.transmission")
        }
    }

    func convert(_ amount: Double, to target: Units) -> String {
        let kelvinValue: Double
        switch self {
        case .kelvin:
            kelvinValue = amount
        case .celsius:
            kelvinValue = amount + 273.15
        case .fahrenheit:
            kelvinValue = (amount - 32) * 5 / 9 + 273.15
        case .rankine:
            kelvinValue = amount * 5 / 9
        case .reaumur:
            kelvinValue = amount * 1.25 + 273.15
        }

        let convertedAmount: Double
        switch target {
        case .kelvin:
            convertedAmount = kelvinValue
        case .celsius:
            convertedAmount = kelvinValue - 273.15
        case .fahrenheit:
            convertedAmount = (kelvinValue - 273.15) * 1.8 + 32
        case .rankine:
            convertedAmount = kelvinValue * 9 / 5
        case .reaumur:
            convertedAmount = (kelvinValue - 273.15) * 0.8
        }

        return String(format: "%.2f", convertedAmount)
    }

    static func convert(_ amount: String, from sourceUnit: Units, to targetUnit: Units) -> String {
        guard let amountDouble = Double(amount) else { return "" }
        return sourceUnit.convert(amountDouble, to: targetUnit)
    }
    
    func isBelowAbsoluteZero(value: Double) -> Bool {
        switch self {
        case .kelvin:
            return value < 0
        case .celsius:
            return value < -273.15
        case .fahrenheit:
            return value < -459.67
        case .rankine:
            return value < 0.0002
        case .reaumur:
            return value < -218.52
        }
    }

    var id: Units { self }
}
