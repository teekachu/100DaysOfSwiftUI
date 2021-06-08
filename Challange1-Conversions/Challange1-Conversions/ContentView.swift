//
//  ContentView.swift
//  Challange1-Conversions
//
//  Created by Ting Becker on 5/29/21.
//

import SwiftUI

struct ContentView: View {
    // Properties
    let units = ["Meters", "Foot", "Yard", "Miles"]
    
    @State private var inputUnitAmount = ""
    @State private var selectedInputUnitSegment = 0 // Input segment
    @State private var selectedOutputUnitSegment = 0 // Output segment
    
    var inputConvertedToBaseunit: Double { // Baseunit is in millimeters
        guard let inputNumber = Double(inputUnitAmount) else {return 0}
        
        var convertToBaseUnit = Double(1)
        var convertToOutputUnit = Double(1)
        
        switch selectedInputUnitSegment{
        case 0: convertToBaseUnit = 1000
        case 1: convertToBaseUnit = 304.8
        case 2: convertToBaseUnit = 914.4
        case 3: convertToBaseUnit = 0.000001609
        default: convertToBaseUnit = 1
        }
        
        switch selectedOutputUnitSegment{
        case 0: convertToOutputUnit = 0.001
        case 1: convertToOutputUnit = 0.00328084
        case 2: convertToOutputUnit = 0.00109361
        case 3: convertToOutputUnit = 0.00000062137
        default: convertToOutputUnit = 1
        }
        
        return inputNumber * convertToBaseUnit * convertToOutputUnit
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter number here", text:$inputUnitAmount)
                        .keyboardType(.numberPad)
                    
                    Picker("Input Unit", selection: $selectedInputUnitSegment) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Picker("Output Unit", selection: $selectedOutputUnitSegment) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack{
                        Text("\(inputUnitAmount)")
                        Text("\(units[selectedInputUnitSegment])  ")
                    }
                    Text("Is equivalent to")
                    HStack{
                        Text("\(inputConvertedToBaseunit, specifier: "%.2f")") // This should show the output value
                        Text("\(units[selectedOutputUnitSegment])")
                    }
                }
            }
            .navigationBarTitle("Length Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
        
    }
}
