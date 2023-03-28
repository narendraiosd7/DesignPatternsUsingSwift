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

/*
 With a shallow copy, any object pointed to by the source is also pointed to by the destination. So only one object will be created in the memory. A copy of a class object is a shallow copy.

 Shallow copies are faster than deep copy, because of sharing the reference only. The created copy doesn’t entirely create a new instance in memory, just address/reference is copied.

 As reference is shared, value change in a copy changes all the other. So in race condition and multi-thread issues, a shallow copy is risky.
 */

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

// Deep Copy:

/*
 A deep copy is the value type of copy. When a structure is copied, it is deep type copy.

 Deep Copy duplicates everything. With a deep copy, any object pointed to by the source is copied and the copy is pointed to by the destination.

 In the case of a race condition and multi-thread issue, there is no worry about impacting other copy while changing in a copy. In a deep copy, there are multiple copies and there is no relation among the copies.

 Deep Copy is slower than Shallow Copy.
 */


class WWDCMeeting: NSObject, NSCopying {
    var name: String
    var meetLocation: MeetLocation
    
    init(name: String, meetLocation: MeetLocation) {
        self.name = name
        self.meetLocation = meetLocation
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let location = self.meetLocation.copy() as! MeetLocation
        return WWDCMeeting(name: self.name, meetLocation: location)
    }
}

class MeetLocation: NSObject, NSCopying {
    var place: String
    
    init(place: String) {
        self.place = place
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return MeetLocation(place: self.place)
    }
}

let wwdcMeeting = WWDCMeeting(name: "WWDC", meetLocation: MeetLocation(place: "canada"))
let clonedMeet = wwdcMeeting.copy() as? WWDCMeeting

wwdcMeeting.meetLocation.place = "New York"

print(wwdcMeeting.meetLocation.place)
print(clonedMeet?.meetLocation.place ?? "")


