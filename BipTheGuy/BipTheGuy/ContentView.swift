//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Max Pintchouk on 9/22/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack {
            Spacer()
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound(soundName: "punchSound")
                }
            Spacer()
            Button {
                // TODO
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
            .font(.title)
        }
        .padding()
    }
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file named: \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription) creating audio player")
        }
                
    }
}

#Preview {
    ContentView()
}
