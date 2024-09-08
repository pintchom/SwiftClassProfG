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
                    imageNumber += 1
                    imageNumber = imageNumber%9
                    imageString = "image\(imageNumber)"
                    messageString = messages[imageNumber%4]
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
