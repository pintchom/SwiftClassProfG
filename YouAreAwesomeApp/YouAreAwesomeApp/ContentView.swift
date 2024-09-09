//
//  ContentView.swift
//  YouAreAwesomeApp
//
//  Created by Max Pintchouk on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString: String = ""
    @State private var imageString: String = ""
    @State private var imageNumber: Int = -1
    @State private var messageNumber: Int = -1

    let messages = ["1", "2", "3", "4"]
    var body: some View {
        VStack {
            
            Spacer()
            Image(imageString)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .foregroundStyle(Color("Maroon"))
            
            Spacer()
            
            HStack {
                Button("Next Image") {
                    let lastImageNumber = imageNumber
                    let lastMessageNumber = messageNumber
                    repeat {
                        imageNumber = Int.random(in: 0...9)
                    } while imageNumber == lastImageNumber
                    
                    repeat {
                        messageNumber = Int.random(in: 0...3)
                    } while lastMessageNumber == messageNumber
                    
                    imageString = "image\(imageNumber)"
                    messageString = messages[messageNumber]
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
