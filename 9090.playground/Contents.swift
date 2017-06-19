import UIKit
import EventKit


class NNReminder: EKReminder {
    var obj = "obj"
}

var arrayBase = [EKReminder]()
for _ in 0..<4 {
    let reminder = EKReminder()
    arrayBase.append(reminder)
}

var array = [NNReminder]()
array = arrayBase.flatMap { $0 as? NNReminder }
print(array.count)

//array cannot be casted to NNReminder. Because downcast is not avaialable very easily in Swift Programming Language.

func someThrowingFunction() throws -> Int {
    print("afafa")
    return 0
}

struct Order {
    var name: String
    var l: String
    init(name: String, l: String) {
        self.name = name
        self.l = l
    }
}
