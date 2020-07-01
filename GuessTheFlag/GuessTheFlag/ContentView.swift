//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tianna Henry-Lewis on 2020-05-25.
//  Copyright © 2020 Tianna Henry-Lewis. All rights reserved.
//

import SwiftUI

//struct FlagImage: ViewModifier {
//    var flagString: String
//
//    func body(content: Content) -> some View {
//        Image(flagString)
//        .renderingMode(.original)
//        .clipShape(Capsule())
//        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
//        .shadow(color: .black, radius: 2)
//    }
//}

//extension View {
//    func flagImage(from string: String) -> some View {
//        self.modifier(FlagImage(flagString: string))
//    }
//}

struct FlagImage: View {
    let flagString: String

    var body: some View {
        Image(flagString)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack{
                    Text("Tap the Flag of:")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(flagString: self.countries[number])
                    }
                }
                Text("Score: \(score)")
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreMessage = "Good job, that is the flag for \(countries[correctAnswer])"
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "Oops that is the flag for \(countries[number]) not \(countries[correctAnswer])"
            if score != 0 {
                score -= 1
            }
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
