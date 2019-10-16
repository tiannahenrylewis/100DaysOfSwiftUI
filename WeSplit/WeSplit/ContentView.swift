//
//  ContentView.swift
//  WeSplit
//
//  Created by Tianna Henry-Lewis on 2019-10-15.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var tapCount = 0
    
    //@State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        
        Picker("Select Your Student", selection: $selectedStudent) {
            ForEach (0 ..< students.count) {
                Text(self.students[$0])
            }
        }
        
//        Form {
//            ForEach(0 ..< 100) {
//                Text("Row \($0)")
//            }
//        }
        
//        Form {
//            TextField("Enter Your Name", text: $name)
//            Text("Hello \(name)")
//        }
        
        /*
        If observing elements below, comment out the below
        botton element code
        */
//        Button("Tap Count: \(tapCount)") {
//            self.tapCount += 1
//        }
        
        /*
         Uncomment to observe NavigationView, Form, Section,
         Group, and Text Elements
        */
        
//                NavigationView {
//                    Form {
//                        Section{
//                            Group {
//                                Text("Hello World")
//                                Text("Hello World")
//                            }
//                            Group {
//                                Text("Hello World")
//                                Text("Hello World")
//                            }
//                        }
//                        Section {
//                            Text("Hello World")
//                            Text("Hello World")
//                            Text("Hello World")
//                            Text("Hello World")
//                            Text("Hello World")
//                        }
//                    }
//                    .navigationBarTitle("SwiftUI")
//                }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
