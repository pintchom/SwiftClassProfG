//
//  ContentView.swift
//  Predict!
//
//  Created by Max Pintchouk on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    let messages: [String] = ["It is certain",
                                  "It is decidedly so",
                                  "Without a doubt",
                                  "Yes, definitely",
                                  "You may rely on it",
                                  "As I see it, yes",
                                  "Most likely",
                                  "Outlook good",
                                  "Yes",
                                  "Signs point to yes",
                                  "Reply hazy try again",
                                  "Ask again later",
                                  "Better not tell you now",
                                  "Cannot predict now",
                                  "Concentrate and ask again",
                                  "Don't count on it",
                                  "My reply is no",
                                  "My sources say no",
                                  "Outlook not so good",
                                  "Very doubtful"]
    @State private var message: String = ""
    @State private var messageId: Int = 0
    @State private var angle: Int = 0
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            ZStack {
                Image("ball")
                    .resizable()
                    .frame(width: 350, height: 350)
                Circle()
                    .foregroundStyle(.indigo)
                    .frame(width:145, height: 145)
                    .padding(.bottom, 30)
                Text(message)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(width:130, height: 130)
                    .animation(.default, value: message)
                    .padding(.bottom, 30)
                
            }
            .rotationEffect(.degrees(Double(angle)))
            .animation(.easeInOut, value: Double(angle))
            Spacer()
            Spacer()
            Button("Predict!") {
                angle += 360
                var temp = messageId
                repeat {
                    temp = Int.random(in: 0..<messages.count)
                } while temp == messageId
                message = messages[temp]
                messageId = temp
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
