//
//  ContentView.swift
//  WordGarden
//
//  Created by Max Pintchouk on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wordsGuessed: Int = 0
    @State private var wordsMissed: Int = 0
    @State private var wordsToGuess: [String] = ["SWIFT", "DOG", "CAT"]
    @State private var gameStatusMessage: String = "How Many Guesses to Uncover the Hidden Word?"
    @State private var currentWord: Int = 0
    @State private var guessedLetter: String = ""
    @State private var imageName: String = "flower8"
    @State private var playAgainHidden: Bool = true
    @FocusState private var textFieldIsFocused: Bool
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed)")
                }
                Spacer()
                VStack {
                    Text("Words to Guess: \(wordsToGuess.count - (wordsMissed + wordsGuessed))")
                    Text("Words in Game: \(wordsToGuess.count)")
                }
            }
            .padding(.horizontal)
            Spacer()
            Text(gameStatusMessage)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            //TODO SWITCH TO wordsToGuess[currentWord]
            Text("_ _ _ _ _")
                .font(.title)
            
            if playAgainHidden {
                HStack {
                    TextField("", text: $guessedLetter)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }
                        .keyboardType(.asciiCapable)
                        .submitLabel(.done)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: guessedLetter) {
                            guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                            guard let lastChar = guessedLetter.last else {
                                return
                            }
                            guessedLetter = String(lastChar).uppercased()
                        }
                        .focused($textFieldIsFocused)
                    Button {
                        textFieldIsFocused = false
                    } label: {
                        Text("Guess a Letter")
                    }
                    .buttonStyle(.bordered)
                    .tint(.teal)
                    .disabled(guessedLetter.isEmpty)
                }
            } else {
                Button {
                    print()
                } label: {
                    Text("Another Word?")
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }

            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
