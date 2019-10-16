//
//  ContentView.swift
//  Convert
//
//  Created by Tianna Henry-Lewis on 2019-10-16.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Variables
    @State private var tempReading = ""
    @State private var tempUnit = 0
    @State private var convertUnit = 0
    
    var tempUnits = ["°C", "°F", "K"]
    var tempValues = [0.0, 32.0, 273.15]
    
    var convertedValue : Double {
        
        let unitToConvert = Double(tempReading) ?? 0
        
        switch (tempUnit, convertUnit) {
        case (0, 1): //C to F
            return (unitToConvert * 1.8) + 32
        case (0, 2): //C to K
            return unitToConvert + 273.15
        case (1, 0): //F to C
            return (unitToConvert - 32) * (5/9)
        case(1, 2): //F to K
            return (unitToConvert + 459.67) * (5/9)
        case (2, 0): //K to C
            return unitToConvert - 273.15
        case (2, 1): //K to F
            return (unitToConvert * 1.8) - 459.67
        default:
            return unitToConvert
        }
    
    }
    
    //MARK: var body : some View {}
    var body: some View {
        
        NavigationView {
            Form {
                //Top Section Where User Enters Inital Values
                Section(header: Text("Enter Temperature")) {
                    Picker("", selection: $tempUnit) {
                        ForEach(0 ..< tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Temperature", text: $tempReading)
                }
                .keyboardType(.decimalPad)
                
                //Middle Section where user selects the unit to convert to
                Section(header: Text("Select Conversion")) {
                    Picker("", selection: $convertUnit) {
                        ForEach(0 ..< tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                //Bottom section where the user is presented the converted value
                Section(header: Text("Conversion (\(tempUnits[tempUnit]) to \(tempUnits[convertUnit]))")) {
                    //Text("Converted Temperature From:\(tempUnit) - To:\(convertUnit)")
                    Text("\(convertedValue, specifier: "%.1f")\(self.tempUnits[convertUnit])")
                }
                
            } //End of Form
            .navigationBarTitle("Temperature Converter")
        } //End of NavigationView
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
