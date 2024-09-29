//
//  ContentView.swift
//  DungeonDice
//
//  Created by Max Pintchouk on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    @State private var resultMessage = ""
    @State private var buttonsLeftover = 0
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0
    let buttonWidth: CGFloat = 102
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Dungeon Dice")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.red)
                Spacer()
                Text(resultMessage)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(height: 150)
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)]) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftover), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftover), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                //            Group {
                //                HStack {
                //                    Button("\(Dice.four.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice"
                //                    }
                //                    Spacer()
                //                    Button("\(Dice.six.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.six.roll()) on a \(Dice.six.rawValue)-sided dice"
                //                    }
                //                    Spacer()
                //                    Button("\(Dice.eight.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.eight.roll()) on a \(Dice.eight.rawValue)-sided dice"
                //                    }
                //                }
                //                HStack {
                //                    Button("\(Dice.ten.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.ten.roll()) on a \(Dice.ten.rawValue)-sided dice"
                //                    }
                //                    Spacer()
                //                    Button("\(Dice.twelve.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue)-sided dice"
                //                    }
                //                    Spacer()
                //                    Button("\(Dice.twenty.rawValue)-sided") {
                //                        resultMessage = "You rolled a \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue)-sided dice"
                //                    }
                //                }
                //                Button("\(Dice.hundred.rawValue)-sided") {
                //                    resultMessage = "You rolled a \(Dice.hundred.roll()) on a \(Dice.hundred.rawValue)-sided dice"
                //                }
                //            }
                //            .buttonStyle(.borderedProminent)
                //            .tint(.red)
            }
            .padding()
            .onChange(of: geo.size.width, perform: { newValue in
                arrangeGridItems(geo: geo)
            })
            .onAppear {
                arrangeGridItems(geo: geo)
            }
        }
    }
    func arrangeGridItems(geo: GeometryProxy) {
        var screenWidth = geo.size.width - horizontalPadding*2
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        let buttonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftover = Dice.allCases.count % buttonsPerRow
    }
}

#Preview {
    ContentView()
}
