//
//  ContentView.swift
//  McConaughey
//
//  Created by Max Pintchouk on 10/21/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var stepperValue: Int = 0
    var body: some View {
        VStack (alignment: .center) {
            Text("How is Matt?")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding()
            Image("matt")
                .resizable()
                .scaledToFit()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 8, x: 5, y: 5)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                }
                .padding()
            Stepper("How Alright is Matt?", value: $stepperValue, in: 0...10)
                .font(.title2)
                .padding()
            Text("\(stepperValue)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                playSound(soundName: "alright")
            } label: {
                Text("Tell Me!")
            }
            .buttonStyle(.bordered)
        

                
        }
        
    }
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file named: \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.numberOfLoops = stepperValue-1
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription) creating audio player")
        }
    }
}

#Preview {
    ContentView()
}
