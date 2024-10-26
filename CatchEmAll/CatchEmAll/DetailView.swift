//
//  DetailView.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import SwiftUI

struct DetailView: View {
    let creature: Creature
    @State private var creatureDetail = CreatureDetail()
    var body: some View {
        VStack (alignment: .leading, spacing: 3) {
            Text(creature.name.capitalized)
                .font(Font.custom("Avenir Next Condensed", size: 60))
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            HStack {
                creatureImage
                VStack (alignment: .leading){
                    HStack {
                        Text("Height: ")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text(String(format: "%.1f", creatureDetail.height))
                            .font(.largeTitle)
                            .bold()
                    }
                    HStack {
                        Text("Weight: ")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text(String(format: "%.1f", creatureDetail.weight))
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .task {
            creatureDetail.urlstring = creature.url
            await creatureDetail.getData()
        }
    }
}

extension DetailView {
    var creatureImage: some View {
        AsyncImage(url: URL(string: creatureDetail.imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8, x: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            } else if phase.error != nil {
                Image(systemName: "questionmark.square.dashed")
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8, x: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            } else {
                ProgressView()
                    .tint(.red)
                    .scaleEffect(4)
            }
        }
        .frame(width: 96, height: 96)
        .padding(.trailing)

    }
}

#Preview {
    DetailView(creature: Creature(name: "bulbausaur", url: "https://pokeapi.co/api/v2/pokemon/1"))
}
