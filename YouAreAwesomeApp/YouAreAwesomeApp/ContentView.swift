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
    var body: some View {
        VStack {
            Spacer()
            Text(messageString)
                .font(.largeTitle)
                .foregroundStyle(Color("Maroon"))
            
            Spacer()
            Image(imageString)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            Spacer()
            
            
            Spacer()
            
            HStack {
                Button("Next Image") {
                    let lastImageNumber = imageNumber
                    let lastMessageNumber = messageNumber
                    let lastSoundNumber = soundNumber
                    repeat {
                        imageNumber = Int.random(in: 0...9)
                    } while imageNumber == lastImageNumber
                    
                    repeat {
                        messageNumber = Int.random(in: 0...3)
                    } while lastMessageNumber == messageNumber
                    
                    imageString = "image\(imageNumber)"
                    messageString = messages[messageNumber]
                    //audio
                    repeat {
                        soundNumber = Int.random(in: 0...5)
                    } while lastSoundNumber == soundNumber
                    let soundName = "sound\(soundNumber)"
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
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
