//
//  DetailView.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI

struct DetailView: View {
    @State var toDo: String
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var notes = ""
//    @State private var dueDate = Date.now + 60*60*24
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $toDo)
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
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // TODO: ADD SAVE CODE HERE
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: "Item 1")
    }
}
