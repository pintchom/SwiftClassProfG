import UIKit

//enum Direction {
//    case up
//    case down
//    case right
//    case left
//}
//var latestMove = Direction.down
//print("The last move was", latestMove)
//print("The last move as:" + "\(latestMove)".capitalized)
//

//enum Move: String {
//    case up = "North"
//    case down = "South"
//    case right = "East"
//    case left = "West"
//}
//var playerMove: Move = .right
//print(playerMove, playerMove.rawValue)
//print(type(of: playerMove.rawValue))

//enum Move: String {
//    case up, down, left, right
//    var value: Int {
//        switch self {
//        case .up, .right:
//            return 1
//        case .down, .left:
//            return -1
//        }
//    }
//}
//var playerMove: Move = .up
//print(playerMove, playerMove.value)

//enum Ordinal: Int, CaseIterable {
//    case first = 1, second, third, fourth, fifth, sixth, seventh, eigth, ninth, tenth
//}
//var jensPlace = Ordinal.second
//print(jensPlace, jensPlace.rawValue)
//
//for place in Ordinal.allCases {
//    print("To come in \(place) means you came in position #\(place.rawValue)")
//}
//var profGPlace = Ordinal.tenth
//print("Prof. G. was in \(profGPlace) place. This was position \(profGPlace.rawValue) of \(Ordinal.allCases.count)")

//enum Grades: Double {
//    case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
//}
//var studentGrades: [Grades] = []
//studentGrades.append(.C)
//studentGrades.append(.D)
//studentGrades.append(.B)
//studentGrades.append(.A)
//
//var sum = 0.0
//for grade in studentGrades {
//    sum += grade.rawValue
//}
//print("The GPA is \(sum/Double(studentGrades.count))")

//Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
    
    func barcodeString() -> String {
        switch self {
        case .upc(let v1, let v2, let v3, let v4):
            return "\(v1) \(v2) \(v3) \(v4)"
        case .qrCode(let v1):
            return v1
        }
    }
}

let cheerios: Barcode = .upc(8, 21345, 27, 12345)
let elliosPizza: Barcode = .qrCode("asdasdasdasdasd")
print(cheerios)
print(elliosPizza)
print(cheerios.barcodeString())
print(elliosPizza.barcodeString())


