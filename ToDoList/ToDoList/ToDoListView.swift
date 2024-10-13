//
//  ContentView.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift", "Build Apps", "Change the World", "Brind the Awesome", "Take a Vacation"]
    @State private var sheetIsPresented: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id:\.self) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("School Year")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}