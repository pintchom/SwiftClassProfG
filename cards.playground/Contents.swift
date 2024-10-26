import UIKit


enum Suits: String, CaseIterable {
    case hearts = "❤️"
    case clubs = "♣️"
    case spades = "♠️"
    case diamonds = "♦️"
}

Suits.allCases.forEach {print("\($0): \($0.rawValue)")}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String = "DEFAULT", lastName: String = "DEFAULT") {
        self.firstName = firstName
        self.lastName = lastName
    }
}
var person = Person(firstName: "Calvin", lastName: "Brodice")
print("first name: \(person.firstName), last name: \(person.lastName)")
var person2 = Person()
print("first name: \(person2.firstName), last name: \(person2.lastName)")

struct Card {
    var value: Int
    var type: String
    var suit: String
}

var card = Card(value: 12, type: "Q", suit: "❤️")
print("\(card.type)\(card.suit) has value \(card.value)")

var cards: [Card] = []
let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
for i in 0...12 {
    for j in "❤️♦️♠️♣️" {
        cards.append(Card(value: Int(i+1), type: String(values[i]), suit: String(j)))
    }
}
cards.forEach { print("\($0.type)\($0.suit) has value \($0.value)") }
