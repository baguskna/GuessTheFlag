//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bagus Kurnia on 17/07/22.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var showingScore: Bool = false
  @State private var scoreTitle: String = ""
  
  var body: some View {
    ZStack {
      Color.blue
        .ignoresSafeArea()
      
      VStack {
        VStack {
          Text("Tap the flag of")
          Text(countries[correctAnswer])
        }
        
        ForEach(0..<3) { number in
          Button {
            flagTapped(number)
          } label: {
            Image(countries[number])
              .renderingMode(.original)
          }
        }
      }
    }
    .alert(scoreTitle, isPresented: $showingScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is ??")
    }
  }
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
    } else {
      scoreTitle = "Wrong"
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
