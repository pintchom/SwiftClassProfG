//
//  DetailView.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var toDo: ToDo
    @State private var item: String = ""
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var notes = ""
//    @State private var dueDate = Date.now + 60*60*24
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder:", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date:", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            Text("Notes:")
                .padding(.top)
                .listRowSeparator(.hidden)
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Toggle("Completed:", isOn: $completed)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear {
            item = toDo.item
            reminderIsOn = toDo.reminderIsOn
            completed = toDo.isCompleted
            notes = toDo.notes
            dueDate = toDo.dueDate
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //Move data from local vars to ToDo object
                    toDo.item = item
                    toDo.reminderIsOn = reminderIsOn
                    toDo.isCompleted = completed
                    toDo.notes = notes
                    toDo.dueDate = dueDate
                    modelContext.insert(toDo)
                    guard let _ = try? modelContext.save() else {
                        print("😡")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}
