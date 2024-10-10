//
//  Color.swift
//  TempConvertor
//
//  Created by Patryk Knopp on 10/10/2024.
//

import SwiftUI

extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00ff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
