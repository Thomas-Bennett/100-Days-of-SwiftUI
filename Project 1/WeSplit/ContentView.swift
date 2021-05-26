//
//  ContentView.swift
//  WeSplit
//
//  Created by Thomas Bennett on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ State private var checkAmount = ""
    @ State private var numberOfPeople = 2
    @ State private var tipPercentage = 2
    
    let tipPerctenages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPerctenages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / people
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPerctenages.count) {
                            Text("\(self.tipPerctenages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("Simple: Tip Calculator")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().preferredColorScheme(.light)
    }
}
