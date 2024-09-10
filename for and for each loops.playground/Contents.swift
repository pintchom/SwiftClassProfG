import UIKit

for count in 1...5 {
    print(count)
}

let tubbies: [String] = ["Tinky Winky", "Dipsey", "La La", "Po"]
for index in 0...tubbies.count-1 { // Full open range inclusive
    print(tubbies[index])
}
print("\nHALF OPEN RANGE")
for index in 0..<tubbies.count { // half open range, excludes last
    print(tubbies[index])
}
print("\nITERATE THROUGH ARRAY")
for tubby in tubbies {
    print(tubby)
}

let quizzes: [Double] = [72, 81, 89, 95, 92]
var average: Double {
    var sum: Double = 0
    for quiz in quizzes {
        sum += quiz
    }
    return sum/Double(quizzes.count)
}
print(average)

print("\nSTRIDE")
//for year in stride(from: 2024, through: 2050, by: 4) {
//    print(year)
//}
//for year in stride(from: 2024, to: 2048, by: 4) {
//    print(year)
//}
