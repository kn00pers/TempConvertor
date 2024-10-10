//
//  ContentView.swift
//  TempConvertor
//
//  Created by Patryk Knopp on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    
@State private var leftAmount = ""
@State private var rightAmount = ""
@State private var leftUnit: Units = .celsius
@State private var rightUnit: Units = .fahrenheit
    
    var body: some View {
        ZStack {
            // Gradient jako tło
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#4687DA"), Color(hex: "#5F46DA")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                Image(systemName: "thermometer.medium")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .scaledToFit()
                    .frame(height: 25)
                    
                
                Text("TempConverter")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white) // Zmiana koloru tekstu
                    .padding(.bottom, 50)

            HStack {
                
                
                // left amount
                VStack{
                    HStack{
                        leftUnit.image
                            .scaledToFit()
                            .frame(height: 25)
                            .frame(width: 25)
                        
                        Text(leftUnit.name)
                            .font(.headline)
                            .foregroundStyle(.white)
                            
                    }
                    HStack{
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.all, 20)
                            .keyboardType(.decimalPad)
                    }
                    
                    }
                Image(systemName: "equal")
                    .padding(.top, 35)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                // right amount
                VStack{
                    HStack{
                        rightUnit.image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .frame(width: 25)
                        
                        Text(rightUnit.name)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    HStack{
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.all, 20)
                            .keyboardType(.decimalPad)
                    }
                }
                }
            }
        }
      }
    }

#Preview {
    ContentView()
}
