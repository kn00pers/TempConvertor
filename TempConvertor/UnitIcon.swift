//
//  UnitIcon.swift
//  TempConvertor
//
//  Created by Patryk Knopp on 10/10/2024.
//
import SwiftUI

struct UnitIcon: View {
    let unitImage: Image
    let unitName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
 
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#4687DA"), Color(hex: "#5F46DA")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            

            unitImage
                .resizable()
                .scaledToFit()
                .padding(5)
                .frame(height: 90)
                .foregroundColor(.white)
            

            Text(unitName)
                .padding(5)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.66))
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 100)
        .padding(5)
    }
}


#Preview {
    UnitIcon(unitImage: Image(systemName: "degreesign.celsius"), unitName: "Celsius")
}


