//
//  ContentView.swift
//  WeSplit
//
//  Created by Wubbo Boiten on 23/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    @State private var checkAmount: Double = 0
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Int = 0
    
    
    var totalPerPerson: Double   {
        let tipSelection = Double(tipPercentage)
        let people = Double(numberOfPeople)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / people
        
        
        
        
        return amountPerPerson
    }
    
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Total Amount")){
                    TextField("\(checkAmount)", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "eur"))
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Amount of people")){
                    
                    TextField("Number of people:", value: $numberOfPeople, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Percentage of tip")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text("\($0)%")
                        }
                        .pickerStyle(.segmented)
                    }
                    
                }
                Section(header: Text("To Pay")){
                    Text("€\(totalPerPerson)")
                }
            }
            .navigationTitle("WeSplit")
            
                }
            }
        }
        
    


#Preview {
    ContentView()
}


