//
//  ContentView.swift
//  DungeonDice
//
//  Created by Max Pintchouk on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var resultMessage = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                titleView
                Spacer()
                resultMessageView
                Spacer()
                ButtonLayout(resultMessage: $resultMessage)
            }
            .padding()
        }
    }
    
}

extension ContentView {
    private var titleView: some View {
        Text("Dungeon Dice")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.red)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
    }
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}

#Preview {
    ContentView()
}

