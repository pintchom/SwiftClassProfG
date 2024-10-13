import UIKit
/*
var item = "Learn Swift"
var dueDate = Date.now
var completed = false

class ToDo {
    var item: String
    var dueDate: Date
    var completed: Bool
    
    init(item: String, dueDate: Date, completed: Bool) {
        self.item = item
        self.dueDate = dueDate
        self.completed = completed
    }
    
    func printToDo() {
        print("Item: \(item), Date: \(dueDate), Completed: \(completed)")
    }
}

var aToDoItem = ToDo(item: "Learn Classes", dueDate: Date.now, completed: false)
var toDos: [ToDo] = []
toDos.append(aToDoItem)
toDos.append(ToDo(item: "Learn Swift", dueDate: Date.now, completed: false))
toDos.append(ToDo(item: "Build Apps", dueDate: Date.now + 60*60*24, completed: false))
toDos.append(ToDo(item: "Take a Vacation", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!, completed: false))

print(toDos)

//for i in 0...toDos.count-1 {
//    print("Item: \(toDos[i].item), Completed: \(toDos[i].completed)")
//}

//for toDo in toDos {
//    print("Item: \(toDo.item), Completed: \(toDo.completed)")
//}

//toDos.forEach({print("My item: \($0.item), My Date: \($0.dueDate)")})

for toDo in toDos {
    toDo.printToDo()
}
*/

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

var person = Person(firstName: "Christopher", lastName: "Wallace")
var rapper = person
print("\(person.firstName) \(person.lastName)")
print("\(rapper.firstName) \(rapper.lastName)")
rapper.firstName = "Biggie"
rapper.lastName = "Smalls"
print("\(person.firstName) \(person.lastName)")
print("\(rapper.firstName) \(rapper.lastName)")
person.firstName = "The Notorious"
person.lastName = "BIG"
print("\(person.firstName) \(person.lastName)")
print("\(rapper.firstName) \(rapper.lastName)")
