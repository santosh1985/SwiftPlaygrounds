//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let apples = 3
//let orranges = 5
//
//let appleSummary = "I have \(apples) apples."
//let fruitSummary = "I have \(apples + orranges) pieces of fruits"
//
//var shoppingList = ["catfish", "water", "tulips", "blue plant"]
//shoppingList[1] = "bottle of water"
//shoppingList.insert("coke bottle", at: 2)
//shoppingList.remove(at: 3)
//
//print(shoppingList)

//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    print("Add some raisins and make ants on a log.")
//case "cucumber", "watercress":
//    print("That would make a good tea sandwich.")
//case let x where x.hasSuffix("pepper"):
//    print("Is it a spicy \(x)?")
//default:
//    print("Everything tastes good in soup.")
//}

//let interestingNumbers = [
//    "Prime": [2,3,5,7,11,13],
//    "Fibonacci":[1,1,2,3,5,8],
//    "Square":[1,4,9,16,25]
//]
//
//var largest = 0
//var kinds = ""
//for (kind, numbers) in interestingNumbers {
//    for number in numbers {
//        if number > largest {
//            largest = number
//            kinds = kind
//        }
//    }
//}
//
//print(largest, kinds)

//func greet(_ person: String, on day: String) -> String {
//    return "Hello, \(person), today is \(day)"
//}
//
//greet("Santosh", on: "Saturday")
//
////functions with variable parameters
//func sumOf(numbers: Int... ) -> Int {
//    var sum = 0
//    for number in numbers {
//        sum += number
//    }
//    return sum
//}
//
//sumOf(numbers: 1,2,3)
//sumOf(numbers: 2,3,4,5,6)
//
////nested functions
//func returnFifteen() -> Int {
//    var y = 10
//    func add() {
//        y += 5
//    }
//    add()
//    return y
//}
//
//returnFifteen()
//
////functions are a first-class type=> a fucntion can return another function as its value
//func makeIncrement() -> ((Int) -> Int) {
//    func addOne(number: Int) -> Int {
//        return 1 + number
//    }
//    return addOne
//}
//let inc = makeIncrement()
//inc(4)
//
////A function can take another function as parameter
//func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
//    for item in list {
//        if condition(item) {
//            return true
//        }
//    }
//    return false
//}
//
//func lessThanTen (item: Int) -> Bool {
//    return item < 10
//}
//
//var numbers = [20, 19, 57, 12]
//hasAnyMatches(list: numbers, condition: lessThanTen)
//
//numbers.map { (number: Int) -> Int in
//    let result = 3 * number
//    return result
//}

//enum Rank: Int {
//    case ace = 1
//    case two, three, four, five, six, seven, eight, nine, ten
//    case jack, queen, king
//    func simpleDescription() -> String {
//        switch self {
//        case .ace:
//            return "ace"
//        case .jack:
//            return "jack"
//        case .queen:
//            return "queen"
//        case .king:
//            return "king"
//        default:
//            return String(self.rawValue)
//        }
//    }
//}
//
//let ace = Rank.ace
//let aceRawValue = ace.rawValue

//protocol ExampleProtocol {
//    var simpleDescription: String { get }
//    mutating func adjust()
//}
//
//class SimpleClass: ExampleProtocol {
//    var simpleDescription: String = "A very simple class."
//    var anotherProperty: Int = 69105
//    func adjust() {
//        simpleDescription += "  Now 100% adjusted."
//    }
//}
//
//var a = SimpleClass()
//a.adjust()
//let aDescription = a.simpleDescription
//print(aDescription)
//
//struct SimpleStructure: ExampleProtocol {
//    var simpleDescription: String = "A simple structure"
//    mutating func adjust() {
//        simpleDescription += " (adjusted)"
//    }
//}
//
//var b = SimpleStructure()
//b.adjust()
//let bDescription = b.simpleDescription
//print(bDescription)

//extension Int: ExampleProtocol {
//    var simpleDescription: String {
//        return "The number \(self)"
//    }
//    mutating func adjust() {
//        self += 42
//    }
//}
//print(7.simpleDescription)


//enum PrintedError: ErrorProtocol {
//    case outOfPaper
//    case noToner
//    case onFire
//}
//use `throw` to throw an error and `throws` to make a function that can throw an error.
//If you throw an error in a function, th e function returns immediately and the code that called the function that handles the error.

//func send(job: Int, toPrinter printName: String) throws -> String {
//    if printName == "Never Has Toner" {
//        throw PrintedError.noToner
//    }
//    return "Job Sent"
//}

//do {
//    let printedResponse = try send(job: 1040, toPrinter: "Never Has Toner")
//    print(printedResponse)
//} catch PrintedError.onFire {
//     print("I'll just put this over here, with the rest of the fire.")
//} catch let printedError as PrintedError {
//    print("Printer error: \(printedError).")
//} catch {
//    print(error)
//}

//Another way to handle error is to use `try?` to convert the result to an optional. If the function throws an error, the specific error is discarded and the result is nil. Otherwise, the result is an optional containing the value that the function returned.
//let printerSuccess = try? send(job: 1884, toPrinter: "Never Has Toner")

//Use `defer` to write a block of code that is executed after all other code in the function. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup cde next to each other, even though they need to be executed at different times.

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "Pavi", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possIteger: OptionalValue<Int> = .none
possIteger = .some(100)

func anyCommonElements<T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

print(anyCommonElements(["san","ban","tan"], ["san","tan","kan"]))

func findCommon<T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, rhs: U) -> (Bool, Array<T.Generator.Element>) {
    var items = Array<T.Generator.Element>()
    var found = false
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                items.append(lhsItem)
                found = true
            }
        }
    }
    
    return (found, items)
}


print(findCommon([12,3,4,5,6,7,8], rhs: [3,2,4,5,6,9,8]))

print(findCommon(["San","Tan","Ban","Pav"], rhs: ["Pav","San","Lan"]))

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

public struct ExampleStruct {
    let connectQueue = dispatch_queue_create("connectQueue", nil)
    var test = 10
    
    mutating func example() {
        if let connectQueue = self.connectQueue {
            dispatch_sync(connectQueue) {
                self.test = 20 // error happens here
            }
        }
    }
}
