//
//  ContentView.swift
//  P2-GuessTheFlag
//
//  Created by Ting Becker on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        /// 3x3 Grid
        //        VStack(content: {
        //            ForEach(0..<3) { _ in
        //                HStack(alignment: .center, spacing: 10, content: {
        //                    ForEach(0..<3) {_ in
        //                        Text("X")
        //                    }
        //                })
        //            }
        //        })
        
        //        VStack(alignment: .center, spacing: 20) {
        //            Text("Hello, world!")
        //            Text("This is another text view.")
        ////            Spacer()
        //            Text("Last text view.")
        //        }
        
        ZStack(alignment: .center) {
            
            RadialGradient(
                gradient: Gradient(colors: [Color.yellow, Color.green, Color.blue, Color.yellow]),
                center: .center,
                startRadius: 20, endRadius: 450)
                .edgesIgnoringSafeArea(.all)
            
            //            Color.red
            //                .edgesIgnoringSafeArea(.all) // Ok for decorative views, like this color
            //                .frame(width: 200, height: 200, alignment: .center) // Treat the color as a separate view
            
            VStack(alignment: .center, spacing: 50, content: {
                Text("My texts")
                    .bold()
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                
                Button("Tap me!") {
                    print("My button is tapped.")
                }
                // or
                
                Button(action: {
                    print("My button is tapped.")
                }) {
                    Image(systemName: "pencil")
                        .renderingMode(.original)
                }
                
                Button("Tap me to see alert.") {
                    self.showAlert = true
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Title goes here."),
                          message: Text("Hmmmm message goes here?"),
                          dismissButton: .default(Text("Dismiss")))
                })
                
            })
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

