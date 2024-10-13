//
//  ContentView.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("Show the new view")
                }
                .buttonStyle(.borderedProminent)

            }
            .padding()
        }
    }
}

#Preview {
    ToDoListView()
}
