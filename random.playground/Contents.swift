import UIKit

let diceRoll = Int.random(in: 1...6)
print(diceRoll)
let doubleRoll = Double.random(in: -1...1)
print(doubleRoll)
let randomBool = Bool.random()
print(randomBool)

let result = Int.random(in: 1...4) + Int.random(in: 1...4) + Int.random(in: 1...4)
print("You rolled a \(result)")
print("Coin Flip: \(Bool.random() ? "Heads" : "Tails")")

let messages = ["1", "2", "3", "4"]
print("Random message: \(messages[Int.random(in: 0...messages.count-1)])")
