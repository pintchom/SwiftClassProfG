import UIKit

var guessedLetter: String = "SWIFT"
//guessedLetter.count
//guessedLetter.last
//if let lastChar = guessedLetter.last {
//    guessedLetter = String(lastChar)
//} else {
//    guessedLetter = ""
//}
//print("The last letter is \(guessedLetter)")
//guessedLetter = ""
//guessedLetter.last
////print("The last letter in \(guessedLetter) is \(guessedLetter.last!)")
////if guessedLetter.last != nil {
////    guessedLetter = String(guessedLetter.last!)
////} else {
////    guessedLetter = ""
////}
////print("The last letter is \(guessedLetter)")
//if let lastChar = guessedLetter.last {
//    guessedLetter = String(lastChar)
//} else {
//    guessedLetter = ""
//}
//print("The last letter is \(guessedLetter)")
//
//
//func returnLastChar(text: String) -> String {
//    guard let lastChar = text.last else {
//        return ""
//    }
//    return String(lastChar)
//}
//let swiftLast = "SWIFT"
//let emptyLast = ""
//print("swiftLast: \(returnLastChar(text: swiftLast))")
//print("emptyLast: \(returnLastChar(text: emptyLast))")


print("\nNil Coalescing")
guessedLetter = "SWIFT"
guessedLetter = String(guessedLetter.last ?? " ")
guessedLetter = guessedLetter.trimmingCharacters(in: .whitespacesAndNewlines)
print("guessedLetter = \(guessedLetter)")
guessedLetter = ""
guessedLetter = String(guessedLetter.last ?? " ")
guessedLetter = guessedLetter.trimmingCharacters(in: .whitespacesAndNewlines)
print("guessedLetter = \(guessedLetter)")
