//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tianna Henry-Lewis on 2020-06-19.
//  Copyright © 2020 Tianna Henry-Lewis. All rights reserved.
//

import SwiftUI

//Example of a Custom Modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

//Custom Modifier
struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueTitle() -> some View {
        self.modifier(LargeBlueTitle())
    }
}

//Example of a Custom Modifier
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

//Example of a Custom Container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var completed = false
    
    var body: some View {
        VStack {
            Text("100 Days of Swift")
                .largeBlueTitle()
                .padding()
            
            Text("Project 3")
                .titleStyle()
            .padding()
            Button(completed ? "Completed" : "Mark Completed") {
                self.completed.toggle()
            }
            .padding()
            .background(completed ? Color.green : Color.red)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .watermarked(with: "Tianna Henry-Lewis")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
