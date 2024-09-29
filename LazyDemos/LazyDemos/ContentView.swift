//
//  ContentView.swift
//  LazyDemos
//
//  Created by Max Pintchouk on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var columns = [
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100))
        GridItem(.flexible(maximum: 100)),
        GridItem(.flexible(maximum: 200))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid (rows: columns) {
                ForEach(0..<1000) { i in
                    let _ = print(i)
                    RedAndCyanView()
                }
            }
        }
        .padding()
    }
}

struct RedAndCyanView: View {
    var body: some View {
        ZStack {
            Color(.red)
            Rectangle()
                .fill(.cyan)
                .frame(width: 100, height: 100)
        }
    }
}
#Preview {
    ContentView()
}

