//
//  ContentView.swift
//  P3-ViewsAndModifiers
//
//  Created by Ting Becker on 6/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.yellow)
//            .edgesIgnoringSafeArea(.all)
        
        Button("Hello World!") {
            // something
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
