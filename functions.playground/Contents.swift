import UIKit

//func rollDice() {
//    print("You rolled a \(Int.random(in: 1...6))")
//}
//rollDice()
//rollDice()
//rollDice()
//
//print()
//func rollSidedDice(diceSides: Int) {
//    print("You rolled a \(Int.random(in: 1...diceSides)) on \(diceSides)-sided dice.")
//}
//rollSidedDice(diceSides: 2)
//rollSidedDice(diceSides: 3)
//rollSidedDice(diceSides: 4)
//
//print()
//func rollSeveralDice(numberOfDice: Int, diceSides: Int) {
////    if numberOfDice < 1 {
////        print("Cannot calculate number of dice: \(numberOfDice)")
////        return
////    }
//    guard numberOfDice > 0 else {
//        print("Cannot calculate number of dice: \(numberOfDice)")
//        return
//    }
//    print("Rolling \(numberOfDice), \(diceSides)-sided dice")
//    var total = Int.random(in: 1...diceSides)
//    var returnString = "\(total)"
//    for _ in 2...numberOfDice {
//        let roll = Int.random(in: 1...diceSides)
//        returnString += ", \(roll)"
//        total += roll
//    }
//    print(returnString)
//    print("Total: \(total)")
//}
//rollSeveralDice(numberOfDice: 3, diceSides: 5)


func average(grades: [Int]) -> Double {
    var total = 0
    for grade in grades {
        total += grade
    }
    return Double(total) / Double(grades.count)
}
var michaelGrades = [40, 65, 70, 68]
var pamGrades = [95, 88, 72, 87]
let pamScore = average(grades: pamGrades)
print("Pam earned a: \(pamScore)")
let michaelScore = average(grades: michaelGrades)
print("Michael earned a: \(michaelScore)")

func finalGrades(score: Double) -> String {
    switch score {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}
print()
print("Micheal earned a: \(finalGrades(score: michaelScore))")
print("Pam earned a: \(finalGrades(score: pamScore))")

