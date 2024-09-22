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
    @State private var gameStatusMessage: String = "How Many Guesses to Uncover the Hidden Word?"
    @State private var currentWordIndex: Int = 0
    @State private var wordToGuess: String = ""
    @State private var revealedWord: String = ""
    @State private var lettersGuessed: String = ""
    @State private var guessesRemaining: Int = 8
    @State private var guessedLetter: String = ""
    @State private var imageName: String = "flower8"
    @State private var playAgainHidden: Bool = true
    @State private var playAgainButtonLabel: String = "Another Word?"
    @FocusState private var textFieldIsFocused: Bool
    private let wordsToGuess: [String] = ["SWIFT", "DOG", "CAT"]
    private let maximumGuesses: Int = 8

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
                .frame(height: 80)
                .minimumScaleFactor(0.5)
                .padding()
            //TODO SWITCH TO wordsToGuess[currentWord]
            Text(revealedWord)
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
                        .onSubmit {
                            guard guessedLetter != "" else {
                                return
                            }
                            guessALetter()
                            updateGamePlay()
                        }
                        .focused($textFieldIsFocused)
                    Button {
                        guessALetter()
                        updateGamePlay()
                    } label: {
                        Text("Guess a Letter")
                    }
                    .buttonStyle(.bordered)
                    .tint(.teal)
                    .disabled(guessedLetter.isEmpty)
                }
            } else {
                Button {
                    // if all guessed?
                    if currentWordIndex == wordsToGuess.count {
                        currentWordIndex = 0
                        wordsGuessed = 0
                        wordsMissed = 0
                        playAgainButtonLabel = "Another Word?"
                    }
                    // reset after a word was guessed or missed
                    wordToGuess = wordsToGuess[currentWordIndex]
                    revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
                    lettersGuessed = ""
                    guessesRemaining = maximumGuesses
                    gameStatusMessage = "How Many Guesses to Uncover the Hidden Word?"
                    playAgainHidden.toggle()
                    imageName = "flower\(guessesRemaining)"
                } label: {
                    Text(playAgainButtonLabel)
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
        .onAppear {
            wordToGuess = wordsToGuess[currentWordIndex]
            revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
            guessesRemaining = maximumGuesses
        }
    }
    
    func guessALetter() {
        textFieldIsFocused = false
        lettersGuessed += guessedLetter
        revealedWord = ""
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += "\(letter) "
            } else {
                revealedWord += "_ "
            }
        }
        revealedWord.removeLast()
    }
    
    func updateGamePlay() {
        if !wordToGuess.contains(guessedLetter) {
            guessesRemaining -= 1
            imageName = "flower\(guessesRemaining)"
        }
        if !revealedWord.contains("_") {
            gameStatusMessage = "You've guessed it! It took you \(lettersGuessed.count) Guesses to guess the word \(wordToGuess)"
            wordsGuessed += 1
            currentWordIndex += 1
            playAgainHidden.toggle()
        } else if guessesRemaining == 0 {
            gameStatusMessage = "So Sorry. You're All Out of Guesses."
            wordsMissed += 1
            currentWordIndex += 1
            playAgainHidden.toggle()
        } else { // keep guessing
            gameStatusMessage = "You've made \(lettersGuessed.count) Guess\(lettersGuessed.count == 1 ? "" : "es")"
        }
        if currentWordIndex == wordsToGuess.count {
            playAgainButtonLabel = "Restart Game?"
            gameStatusMessage += "\nYou've Tried All of the Words. Restart from the Beginning?"
        }
        guessedLetter = ""
    }
    
}

#Preview {
    ContentView()
}
