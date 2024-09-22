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
    @State private var animateImage: Bool = true
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false
                    withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
                        animateImage = true
                    }
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
