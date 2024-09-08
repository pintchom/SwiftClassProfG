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
    var body: some View {
        VStack {
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            
//            Text(messageString)
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .minimumScaleFactor(0.5)
//                .multilineTextAlignment(.center)
//                .foregroundStyle(.red)
//                .frame(height: 150)
//                .frame(maxWidth: .infinity)
//                .padding()
            
            Spacer()
            
            HStack {
                Button("Show Image") {
                    imageString = (imageString == "image0" ? "image1" : "image0")
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
