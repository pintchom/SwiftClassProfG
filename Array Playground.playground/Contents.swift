import UIKit

var messages = ["1", "2", "3"]
print(messages)
print(messages[0])
print(messages[messages.count - 1])
messages.append("4")
print(messages[messages.count - 1])

messages += ["5", "6"]
print(messages)

messages.insert("1.5", at: 1)
print(messages)

let removed = messages.remove(at: 1)
print(removed, messages)

var grades: [Double] = [] // : [Double]()
grades.append(82)
grades += [87, 91]
print(grades)
