//
//  Challange1.swift
//  P3-ViewsAndModifiers
//
//  Created by Ting Becker on 6/17/21.
//

import SwiftUI

struct Challange1: View {
    var body: some View {
        ZStack {
            Text("Title Goes Here!")
                .applyBlueTitleToView()
            
            Text("Hello, World!")
        }
    }
}

struct Challange1_Previews: PreviewProvider {
    static var previews: some View {
        Challange1()
    }
}


// View Modifiers
struct largeBlueTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 250, alignment: .top)
            .font(.title)
            .foregroundColor(.blue)
            .background(Color.yellow)
            .padding()
        
    }
}

extension View {
    func applyBlueTitleToView() -> some View {
        self.modifier(largeBlueTitle())
    }
}
