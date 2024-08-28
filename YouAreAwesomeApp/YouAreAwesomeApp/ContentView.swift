//
//  ContentView.swift
//  YouAreAwesomeApp
//
//  Created by Max Pintchouk on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @State var messageString:String = "You Are Awesome!"
    var body: some View {
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .italic()
                .padding()
            Button("Press Me") {
                messageString = "You Are Great!"
            }
        }
    }
}

#Preview {
    ContentView()
}
