import UIKit

var myName = "Pintchouk"
var smallerString = "Pin"

//contains
if myName.contains(smallerString) {
    print("\(myName) contains \(smallerString)")
} else {
    print("There is no \(smallerString) in \(myName)")
}

//hasPrefix, hasSuffix
var occupation = "Good Developer"
var searchString = "Swift"

print("\nPrefix Search")
if occupation.hasPrefix(searchString) {
    print("You're Hired")
} else  {
    print("No job for you")
}

occupation = "IOS Hater"
searchString = "Developer"
print("\nSuffix Search")
if occupation.hasSuffix(searchString) {
    print("We need more \(occupation)'s!")
} else  {
    print("No job for you! No one needs any \(occupation)'s")
}

//.removeLast()
print("\nREMOVE LAST")
var bandName = "The White Stripes"
let lastChar = bandName.removeLast()
print("After we remove \(lastChar) the band is jsut \(bandName)")

print("\nREMOVE FIRST")
var person = "Dr. Nick"
let title = "Dr."
person.removeFirst(title.count)
person = person.trimmingCharacters(in: .whitespacesAndNewlines)
print(person)

//.replacingOccurances(of: with:)
print("\nREPLACING OCCURANCES OF")
// 123 James St.
// 123 James St
// 123 James Street
var address = "123 James St."
var streetString = "St."
var replacementString = "Street"
var standardAddress = address.replacingOccurrences(of: streetString, with: replacementString)
print(standardAddress, address)

//Iterate through a string
print("\nBACKWARDS STRING")
var name = "Pintchouk"
var backwardsName = ""
for letter in name.reversed() {
    backwardsName += String(letter)
}
print("\(name) and \(backwardsName)")


//Capitalization
print("\nPlaying with caps")
var crazyCaps = "SwIfT dEvElOPer"
var uppercased = crazyCaps.uppercased()
var lowercased = crazyCaps.lowercased()
var capitalized = crazyCaps.capitalized
print(crazyCaps)
print(uppercased, lowercased, capitalized)

//word to guess challenge
print("\nWORD TO GUESS")
var wordToGuess = "Swift"
var revealedWord = "_"

for _ in 1...wordToGuess.count-1 {
    revealedWord = revealedWord + " _"
}
print("\(wordToGuess) will show as \(revealedWord)")

//Create a string from a repeating value
revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
print("\nUSING REPEATING STRING")
print(revealedWord)

//reveal the word
print("\nREVEAL THE WORD")
wordToGuess = "STARWARS"
var lettersGuessed = "SQFTXW"
revealedWord = ""
for letter in wordToGuess {
    if lettersGuessed.contains(letter) {
        revealedWord += "\(letter) "
    } else {
        revealedWord += "_ "
    }
}
revealedWord.removeLast()
print("Word to guess: \(wordToGuess)")
print("lettersGuessed: \(lettersGuessed)")
print("revealedWord: \(revealedWord)")
