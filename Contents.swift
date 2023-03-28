import UIKit

// MARK: - CREATIONAL DESIGN PATTERNS

// Prototype Design Pattern:-

/// Creating a new object from an existing object.
/// The existing object is called as "Prototype" and copied object is called as "Clone".
/// Structs by defaults having this pattern but class objects does not having this.

class Student: NSObject, NSCopying {
    var name: String
    var rollNo: Int
    
    init(name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Student(name: self.name, rollNo: self.rollNo)
    }
}

let student1 = Student(name: "Abhi", rollNo: 01)
let student2 = student1.copy() as? Student

student1.name = "Ram"
student1.rollNo = 02

print(student1.name)
print(student1.rollNo)

print(student2?.name ?? "")
print(student2?.rollNo ?? 0)

// shallow copy:
/// It is default copy. A copy of a class object is a shallow copy. Shallow copies are faster than deep copy, because of sharing the reference only. The created copy doesn't entirely create a new instance in memory, just address/reference is copied. As reference is shared, value change in a copy changes all the other.

class Meeting: NSObject, NSCopying {
    var name: String
    var location: Location
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Meeting(name: self.name, location: self.location)
    }
}

class Location {
    var place: String
    
    init(place: String) {
        self.place = place
    }
}

let meeting = Meeting(name: "WWDC", location: Location(place: "canada"))
let clone = meeting.copy() as? Meeting

meeting.location.place = "New York"

print(meeting.location.place)
print(clone?.location.place ?? "")


