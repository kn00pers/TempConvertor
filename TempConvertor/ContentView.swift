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
    
    @State public var showSelectUnit = false
    @State private var showWarning = false
    
    @FocusState private var leftTyping: Bool
    @FocusState private var rightTyping: Bool
    
    var body: some View {
        ZStack {
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
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                HStack {
                    VStack {
                        HStack {
                            leftUnit.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                                .frame(width: 25)
                            
                            Text(leftUnit.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        HStack {
                            TextField("Amount", text: $leftAmount)
                                .textFieldStyle(.roundedBorder)
                                .padding(.all, 20)
                                .keyboardType(.numbersAndPunctuation)
                                .focused($leftTyping)
                        }
                    }
                    .onTapGesture {
                        showSelectUnit.toggle()
                    }
                    
                    Image(systemName: "equal")
                        .padding(.top, 35)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    VStack {
                        HStack {
                            rightUnit.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                                .frame(width: 25)
                            
                            Text(rightUnit.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        HStack {
                            TextField("Amount", text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .padding(.all, 20)
                                .keyboardType(.numbersAndPunctuation)
                                .focused($rightTyping)

                        }
                    }
                }

                if showWarning {
                    Text("Please note that any temperature below 0 Kelvin is considered absolute zero, and it is impossible to reach such a value.")
                        .foregroundColor(.red)
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showSelectUnit) {
            SelectUnit(topUnit: $leftUnit, bottomUnit: $rightUnit)
        }
        .onChange(of: leftUnit) { newValue in
            if let value = Double(leftAmount), !leftAmount.isEmpty {
                rightAmount = leftUnit.convert(value, to: rightUnit)
            } else {
                rightAmount = ""
            }
        }
        .onChange(of: rightUnit) { newValue in
            if let value = Double(rightAmount), !rightAmount.isEmpty {
                leftAmount = rightUnit.convert(value, to: leftUnit)
            } else {
                leftAmount = ""
            }
        }
        .onChange(of: rightAmount) { newValue in
            if rightTyping {
                if let amount = Double(newValue), !rightUnit.isBelowAbsoluteZero(value: amount) {
                    leftAmount = rightUnit.convert(amount, to: leftUnit)
                    showWarning = false
                } else {
                    leftAmount = ""
                    showWarning = true
                }
            }
        }
        .onChange(of: leftAmount) { newValue in
            if leftTyping {
                if let amount = Double(newValue), !leftUnit.isBelowAbsoluteZero(value: amount) {
                    rightAmount = leftUnit.convert(amount, to: rightUnit)
                    showWarning = false
                } else {
                    rightAmount = ""
                    showWarning = true
                }
            }
        }
        .onTapGesture {
            leftTyping = false
            rightTyping = false
        }
    }
}

#Preview {
    ContentView()
}
