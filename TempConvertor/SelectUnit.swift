//
//  SelectUnit.swift
//  TempConvertor
//
//  Created by Patryk Knopp on 10/10/2024.
//

import SwiftUI

struct SelectUnit: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topUnit: Units
    @Binding var bottomUnit: Units
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#4687DA"), Color(hex: "#5F46DA")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                Text("Select the unit you would like to start with:")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .padding(.top, 15)
                
                IconGrid(selectedUnit: $topUnit)
                
                Text("Select the unit you would like to convert to:")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                
                IconGrid(selectedUnit: $bottomUnit)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Convert")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "#4687DA"), Color(hex: "#5F46DA")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5) 
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    SelectUnit(topUnit: .constant(.celsius), bottomUnit: .constant(.fahrenheit))
}
