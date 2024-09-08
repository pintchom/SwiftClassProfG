//
//  ContentView.swift
//  YouAreAwesomeApp
//
//  Created by Max Pintchouk on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString: String = ""
    var body: some View {
        VStack {
            Spacer()
            
//            Image(systemName: "speaker.wave.2", variableValue: 0.0)
//                .resizable()
//                .scaledToFit()
//                .symbolRenderingMode(.multicolor)
//                .padding()
//                .background(Color(hue: 0.557, saturation: 0.399, brightness: 0.528))
//                .cornerRadius(30)
//                .shadow(color: .red, radius: 100, x:20, y:20)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .stroke(.red, lineWidth: 1)
//                )
//                .padding()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            HStack {
                Button("Show Message") {
                    let message1 = "1"
                    let message2 = "2"
                    messageString = (messageString == message1 ? message2 : message1)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
