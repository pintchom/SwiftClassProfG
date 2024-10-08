//
//  ContentView.swift
//  YouAreAwesomeApp
//
//  Created by Max Pintchouk on 8/28/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString: String = ""
    @State private var imageString: String = ""
    @State private var imageNumber: Int = -1
    @State private var messageNumber: Int = -1
    @State private var soundNumber: Int = -1
    @State private var audioPlayer: AVAudioPlayer! // implicit unwrapping optional
    let messages = ["1", "2", "3", "4"]
    @State private var soundIsOn: Bool = true
    
    
    var body: some View {
        VStack {
            Spacer()
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
                .animation(.easeInOut(duration: 0.15), value: messageString)
            
            Spacer()
            Image(imageString)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
                .animation(.easeInOut(duration: 0.15), value: messageString)
            Spacer()
            
            
            Spacer()
            
            HStack {
                Text("Sound on:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { _, _ in
                        if (audioPlayer != nil) && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
//                    .tint(.indigo)
                Spacer()
                Button("Next Image") {
                    imageNumber = nonRepeatingRandom(lastNumber: imageNumber, upperBound: 9)
                    messageNumber = nonRepeatingRandom(lastNumber: messageNumber, upperBound: messages.count-1)
                    imageString = "image\(imageNumber)"
                    messageString = messages[messageNumber]
                    //audio
                    soundNumber = nonRepeatingRandom(lastNumber: soundNumber, upperBound: 5)
                    let soundName = "sound\(soundNumber)"
                    if soundIsOn {
                        playSound(soundName: soundName)
                    }
                }
                .buttonStyle(.borderedProminent)
//                .tint(.indigo)
                
            }
            .tint(.accentColor)
            .padding()
        }
    }
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Couldn't find file \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 Error: \(error.localizedDescription)")
        }
    }
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var returnNumber = lastNumber
        repeat {
            returnNumber = Int.random(in: 0...upperBound)
        } while returnNumber == lastNumber
        return returnNumber
    }
}

#Preview {
    ContentView()
}
