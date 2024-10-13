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
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                modelContext.insert(toDo)
                                guard let _ = try? modelContext.save() else {
                                    print("😡 Save didnt work")
                                    return
                                }
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                                guard let _ = try? modelContext.save() else {
                                    print("😡 Save didnt work")
                                    return
                                }
                            }
                        }
                    }
                    .font(.title2)
                }
//                .onDelete { indexSet in
//                    indexSet.forEach({modelContext.delete(toDos[$0])})
//                    guard let _ = try? modelContext.save() else {
//                        print("😡 Save didnt work")
//                        return
//                    }
//                }
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
