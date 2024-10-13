//
//  ContentView.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var sheetIsPresented: Bool = false
    @Environment(\.modelContext) var modelContext
    @Query var toDos: [ToDo]
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("School Year")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
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
        .modelContainer(for: ToDo.self, inMemory: true)
}
