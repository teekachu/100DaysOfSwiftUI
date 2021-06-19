//
//  FlagsProjectView.swift
//  P2-GuessTheFlag
//
//  Created by Ting Becker on 6/8/21.
//

import SwiftUI

struct FlagsProjectView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Ireland", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack{
//            Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple, Color.blue]),
                           startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        // action for when flag was tapped
                        self.flagTapped(number)
                        
                    }, label: {
                        Image(self.countries[number])
                            .FlagImage()
//                            .renderingMode(.original)
//                            .clipShape(Capsule()) // Image shape
//                            .overlay(Capsule().stroke(Color.white, lineWidth: 2)) // border radius
//                            .shadow(color: .white, radius: 2)
                        
                    })
                }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .font(.title2)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle),
                  message: Text("Your score is \(score)"),
                  dismissButton: .default(Text("Continue")) {
                    askQuestion()
                  })
        })
    }
    
    // Privates
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, the flag you chose is \(countries[number])"
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

struct FlagsProjectView_Previews: PreviewProvider {
    static var previews: some View {
        FlagsProjectView()
    }
}


// Privates

extension Image {
    func FlagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule()) // Image shape
            .overlay(Capsule().stroke(Color.white, lineWidth: 2)) // border radius
            .shadow(color: .white, radius: 2)
    }
}
