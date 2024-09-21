//
//  ContentView.swift
//  Lunar-Zodiac
//
//  Created by Max Pintchouk on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var year = 2024
    @State private var imageIndex = 4
    var body: some View {
        VStack {
            Text(String(year))
                .foregroundStyle(.red)
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Image("image\(imageIndex)")
                .resizable()
                .scaledToFit()
            Spacer()
            HStack {

                Button {
                    year -= 1
                    imageIndex = imageIndex == 0 ? 11 : imageIndex - 1
                } label: {
                    Image(systemName: "chevron.left")
                        .shadow(color: .black, radius: 30)
                        .fontWeight(.bold)
                }
                .font(.largeTitle)
                Spacer()
                Button {
                    year += 1
                    imageIndex = imageIndex == 11 ? 0 : imageIndex + 1
                } label: {
                    Image(systemName: "chevron.right")
                        .fontWeight(.bold)
                }
                .font(.largeTitle)
            }
            .tint(.red)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
