//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Max Pintchouk on 9/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter: Int = 0
    @State private var toggleIsOn: Bool = true
    @State private var name: String = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate: Date = Date()
    @State private var stepperValue: Int = 1
    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Press Count: \(counter)")
                    .font(.title)
                Button("Press Me") {
                    counter += 1
                }
                .buttonStyle(.borderedProminent)
                .font(.title)
                
                Spacer()
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("name entered: \(name)")
                
                Spacer()
                
                Toggle("Toggle is \(toggleIsOn ? "on" : "off")", isOn: $toggleIsOn)
                Spacer()
            }
                
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a Rectangle Color", selection: $selectedColor)
            
            Spacer()
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            Spacer()
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 1...10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
