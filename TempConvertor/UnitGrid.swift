    //
    //  UnitGrid.swift
    //  TempConvertor
    //
    //  Created by Patryk Knopp on 10/10/2024.
    //
import SwiftUI

struct IconGrid: View {
    @Binding var selectedUnit: Units

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Units.allCases, id: \.self) { unit in
                UnitIcon(unitImage: unit.image, unitName: unit.name)
                    .padding()
                    .shadow(color: selectedUnit == unit ? Color.black.opacity(0.75) : Color.clear, radius: selectedUnit == unit ? 10 : 0)
                    .onTapGesture {
                        withAnimation {
                            selectedUnit = unit
                        }
                    }
            }
        }
    }
}

#Preview {
    IconGrid(selectedUnit: .constant(.celsius))
}
