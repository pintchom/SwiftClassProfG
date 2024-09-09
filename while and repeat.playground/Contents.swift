import UIKit

//var lastRoll = 4
//var newDiceRoll = 4
//
//while lastRoll == newDiceRoll {
//    newDiceRoll = Int.random(in: 1...4)
//}

var diceRoll: Int
var counter = 0
repeat {
    diceRoll = Int.random(in: 1...6)
    counter += 1
    print("Dice Roll #\(counter) = \(diceRoll)")
} while diceRoll != 6
print("It took \(counter) rolls to roll a 6")

