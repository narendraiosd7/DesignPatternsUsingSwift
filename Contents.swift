import UIKit

// MARK: - CREATIONAL DESIGN PATTERNS

// Prototype Design Pattern:-

/// Creating a new object from an existing object.
/// The existing object is called as "Prototype" and copied object is called as "Clone".
/// Structs by defaults having this pattern but class objects does not having this.

class Student {
    var name: String
    var rollNo: Int
    
    init(name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
    
    func copy() -> Student {
        return Student(name: self.name, rollNo: self.rollNo)
    }
}

let student1 = Student(name: "Abhi", rollNo: 01)
let student2 = student1.copy()

student1.name = "Ram"
student1.rollNo = 02

print(student1.name)
print(student1.rollNo)

print(student2.name)
print(student2.rollNo)
