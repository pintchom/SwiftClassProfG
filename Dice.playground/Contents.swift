import UIKit

enum Dice: Int {
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
let twentySided: Dice = .twenty
print("You rolled a \(twentySided.roll()) on a \(twentySided)-sided die.")
print("You rolled a \(Dice.hundred.roll()) on a \(Dice.hundred)-sided die.")
