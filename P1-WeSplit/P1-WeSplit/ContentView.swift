//
//  ContentView.swift
//  P1-WeSplit
//
//  Created by Ting Becker on 5/23/21.
//

import SwiftUI

// Note: structs are immutable
// $Sign means 2-way binding

struct ContentView: View {
    
    // Properties
    @State private var checkAmount = ""
    //    @State private var numberOfPeople = 2
    @State private var numberOfPeopleAsString = ""
    @State private var tipPercentageSegment = 2
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleAsString) ?? 0+2
        let tipSelection = Double(tipPercentages[tipPercentageSegment])
        let orderAmount = Double(checkAmount) ?? 0
        // math
        let tipValue = orderAmount * (tipSelection/100)
        let grandTotal = tipValue + orderAmount
        let perPerson = grandTotal / peopleCount
        // calculate the total per person here
        return perPerson
    }
    
    var netAmount: Double {
        return totalPerPerson * (Double(numberOfPeopleAsString) ?? 0+2)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("This bill")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.numberPad)
                    
                    // Challange 3
                    TextField("Number of People", text: $numberOfPeopleAsString)
                        .keyboardType(.numberPad)
                    
                    //                    Picker("Number of People", selection: $numberOfPeople) {
                    //                        ForEach(2..<10) {
                    //                            Text("\($0) people")
                    //                        }
                    //                    }
                }
                
                Section(header: Text("How much tips to leave")) {
                    Picker("Tip Percentage", selection: $tipPercentageSegment) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                // Challange 2
                Section(header: Text("Total $ including tips")) {
                    Text("$\(netAmount, specifier: "%.2f")" )
                }
                
                // Challange 1
                Section(header: Text("Amount Per Person")) {
                    // %.2f - any sort of floating point number
                    // %g - removed insignificant zeroes from end of number
                    Text("$\(totalPerPerson, specifier: "%.2f")" )
                }
            }
            .navigationBarTitle("We Split")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
