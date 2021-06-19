//
//  ContentView.swift
//  Challange2-RockPaperScissors
//
//  Created by Ting Becker on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var moveSet = ["Scissor", "Rock", "Paper", "Nothing"]
    @State private var myMoveSegment: Int?
    @State private var opponentMoveSegment: Int?
    @State private var showAlert = false
    
    var didWeWin: Bool {
        switch (opponentMoveSegment, myMoveSegment) {
        case (0,1): return true
        case (1,2): return true
        case (2,0): return true
        case (_, _):return false
        }
    }
    
    var sameChoice: Bool {
        switch (opponentMoveSegment, myMoveSegment) {
        case (0,0): return true
        case (1,1): return true
        case (2,2): return true
        case (_, _): return false
        }
    }
    
    var alertMsg: String {
        switch (didWeWin, sameChoice) {
        case (true, false): return "We won!!!"
        case (_,true): return "Well, jinx..."
        case (_,_):return "Aww we lost..."
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.831372549, green: 0.6196078431, blue: 0.5529411765, alpha: 1)),Color(#colorLiteral(red: 0.8705882353, green: 0.8196078431, blue: 0.7411764706, alpha: 1)),Color(#colorLiteral(red: 0.9803921569, green: 0.9647058824, blue: 0.9490196078, alpha: 1))]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack{
                    Text("LET'S PLAY!")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
                    
                    Image("RPS")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 450, height: 350, alignment: .center)
                        .clipShape(Circle())
                        .shadow(color: Color(#colorLiteral(red: 0.6901960784, green: 0.5176470588, blue: 0.003921568627, alpha: 1)), radius: 8)
                }
                
                Spacer()
                
                VStack {
                    ForEach(0..<3) { number in
                        Button(action: {
                            myMoveSegment = number
                            opponentMoveSegment = Int.random(in: 0...2)
                            showAlert = true
                            
                            
                            
                        }, label: {
                            Text("\(moveSet[number])")
                        })
                        .frame(width: 250, height: 95, alignment: .center)
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.9647058824, blue: 0.9490196078, alpha: 1)))
                        .alert(isPresented: $showAlert, content: {
                            Alert(title:Text(alertMsg),
                                  message: Text("The opponent chose \(moveSet[opponentMoveSegment ?? 3]) and we chose \(moveSet[myMoveSegment ?? 3])"),
                                  dismissButton: .cancel())
                        })
                    }
                    
                    .background(
                        Color(#colorLiteral(red: 0.6901960784, green: 0.5176470588, blue: 0.003921568627, alpha: 1)))
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color(#colorLiteral(red: 0.9803921569, green: 0.9647058824, blue: 0.9490196078, alpha: 1)), lineWidth: 2))
                    .shadow(color: Color(#colorLiteral(red: 0.831372549, green: 0.6196078431, blue: 0.5529411765, alpha: 1)), radius: 5)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}


