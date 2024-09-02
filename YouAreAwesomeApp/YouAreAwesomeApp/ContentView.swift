//
//  ContentView.swift
//  YouAreAwesomeApp
//
//  Created by Max Pintchouk on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString: String = "When the genuis bar needs help, they call you!"
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Group {
                    Text("hi")
                    Text("hi")
                    Text("hi")
                    Text("hi")
                    Text("hi")
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                
                Group {
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
                    Divider()
                        .background(.black)
                        .padding()
                        .frame(width: 150.0)
                    Rectangle()
                        .fill(.indigo)
                        .frame(width: geometry.size.width*(0.5), height: 1)
                }
                HStack {
                    Button("Awesome") {
                        messageString = "You Are Awesome!"
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                    
                    Button("Great") {
                        messageString = "You Are Great!"
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
