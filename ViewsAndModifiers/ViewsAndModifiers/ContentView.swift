//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tianna Henry-Lewis on 2020-06-19.
//  Copyright © 2020 Tianna Henry-Lewis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var completed = false
    
    var body: some View {
        VStack {
            Text("100 Days of SwiftUI")
                .font(.largeTitle)
            Text("Day 23")
            .padding()
            Button(completed ? "Completed" : "Mark Completed") {
                self.completed.toggle()
            }
            .padding()
            .background(completed ? Color.green : Color.red)
            .foregroundColor(Color.white)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.yellow)
//        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
