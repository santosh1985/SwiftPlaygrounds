//: Playground - noun: a place where people can play

import UIKit
import Foundation

//public struct ExampleStruct {
//    let connectQueue = DispatchQueue(label: "connectQueue", attributes: .concurrent)
//    
//    var test = 10
//    
//    mutating func example() {
//        connectQueue.sync { 
//            self.test = 20
//        }
//    }
//}

//let string = "CS2210"
//
//let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//label.textAlignment = .Center
//label.baselineAdjustment = .None
//let attributedString = NSAttributedString(string: string, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue, NSLigatureAttributeName: 1])
//label.attributedText = attributedString
//
//label.attributedText

//var str = "Hello, playground"
//
//var townname = "Azadinos"
//var population: Int = 5422
//var message = ""
//var Haspostoffice: Bool = true
//
//func printMyVars() {
//    if population < 10000 {
//        message = "with a population of \(population), \(townname) is a small town"
//    } else if population >= 10000 && population < 15000 {
//        message = "with a population of \(population), \(townname) is a medium sized town!"
//    } else {
//        message = "\(townname) is a huge town!"
//    }
//    print(message)
//}
//printMyVars()
//population = 250000
//printMyVars()
//
//var user = NSDictionary()
//
//let ye = 4
//
//if ye > 0 {
//    user = ["fname":"santosh","lname":"pawar"]
//}
//
//print(user)

import CoreData


//=============================
//let string1 = "string1"
//let string2 = "string2"
//let formattedString = String(format: "%-15s - %s",
//                 COpaquePointer(string1.cStringUsingEncoding(NSUTF8StringEncoding)!),
//                 COpaquePointer(string2.cStringUsingEncoding(NSUTF8StringEncoding)!)
//)

//print(formattedString)

//for _ in 0...4 {
//    print("Hello")
//}
//=============================
let animals = ["fish", "cat", "chicken", "dog"]
let sortedAnimals = animals.sort (<)

class Address {
    var fullAddress: String
    var city: String
    
    init(fullAddress: String, city: String) {
        self.fullAddress = fullAddress
        self.city = city
    }
}

class Person {
    var name: String
    var address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}
//=============================
//var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
//var ray = Person(name: "Ray", address: headquarters)
//var brian = Person(name: "Brian", address: headquarters)
////print(headquarters.fullAddress)
//brian.address.fullAddress = "101 Maybrook Dr"
//print(ray.address.fullAddress)
//=============================
//if nil == .None {
//    print("yes")
//}
//
//enum Optional<T> {
//    case None
//    case Some(T)
//}
//=============================
//public class ThermometerClass {
//    private(set) var temperature: Double = 0.0
//    public func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//let thermometerClass = ThermometerClass()
//thermometerClass.registerTemperature(56.0)
//
//public struct ThermometerStruct {
//    private(set) var temperature: Double = 0.0
//    public mutating func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//var thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(56.0)
//
//=============================
//var thing = "Cars"
//
//let closure = {
//    print("I Love \(thing)")
//}
//closure()
//thing = "airplanes"
//closure()
//=============================
//func countUniques<T: Comparable>(array: Array<T>) -> Int {
//    let sorted = array.sort(<)
//    let initial: (T?, Int) = (.None, 0)
//    let reduced = sorted.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)}
//    return reduced.1
//}
//print(countUniques(["S","P","S","SS","PP"]))
//
//extension Array where Element: Comparable {
//    func countUniques() -> Int {
//        let sorted = sort(<)
//        let initial: (Element?, Int) = (.None, 0)
//        let reduced = sorted.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)}
//        return reduced.1
//    }
//}

//print([1,2,3,3].countUniques())
//=============================
//func doIt(@noescape code: () -> ()) {
//    code()
//}
//
//class Bar {
//    var i = 0
//    func some () {
//        doIt {
//            print(i)
//        }
//    }
//}
//
//let b = Bar()
//b.some()
//=============================
//func divide(dividend: Double?, by divisor: Double?) -> Double? {
//    guard let upper = dividend, lower = divisor where lower != 0 else {
//        return .None
//    }
//    return upper / lower
//}
//
//print(divide(0, by: 10))

//=============================
//struct Thermometer {
//    var temperature: Double
//    init(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//let t: Thermometer = Thermometer(temperature: 56.2)
//print(t.temperature)
//
//extension Thermometer: FloatLiteralConvertible {
//    init(floatLiteral value: FloatLiteralType) {
//        self.init(temperature: value)
//    }
//}
//
//let tt:Thermometer = 56.8
//print(tt.temperature)
//=============================
//infix operator ^^ {associativity right precedence 155}
//func ^^(lhs: Int, rhs: Int) -> Int {
//    let l = Double(lhs)
//    let r = Double(rhs)
//    let p = pow(l, r)
//    return Int(p)
//}
//
//
//print(2^^4)
//=============================
//struct Pizza {
//    let ingredients: [String]
//}
//
//protocol Pizzaria {
//    func makePizza(ingredients: [String]) -> Pizza
//    func makeMargerita() -> Pizza
//}
//
//extension Pizzaria {
//    func makeMargerita() -> Pizza {
//        return makePizza(["tomato", "mozzarella"])
//    }
//}
//
//struct Restaurants: Pizzaria {
//    func makePizza(ingredients: [String]) -> Pizza {
//        return Pizza(ingredients: ingredients)
//    }
//    func makeMargerita() -> Pizza {
//        return makePizza(["tomato", "basil","mozzarella"])
//    }
//}
//
//let rest1: Pizzaria = Restaurants()
//let rest2: Restaurants = Restaurants()
//
//print(rest1.makeMargerita())
//print(rest2.makeMargerita())
//=============================
//enum KittenError: ErrorType {
//    case NoKitten
//}

//protocol KittenPro {
//    
//}
//
//struct Kitten: KittenPro {
//    
//}
//
//
//func showKitten(kitten: Kitten?) throws {
//    guard let k = kitten else {
//        print("No kitten")
//        throw KittenError.NoKitten
//    }
//    print(k)
//}
//try showKitten(nil)
//=============================
//enum Either<T, V> {
//    case Left(T)
//    case Right(V)
//}
//
//indirect enum List<T> {
//    case Node(T, List<T>)
//}
//
//enum my: String {
//    case one = "adad"
//    case two = "skfk"
//}
//
//print(my.init(rawValue: "adad"))

//=============================

//func testing() {
//    var date: NSDate?
//    dispatch_async(dispatch_get_main_queue()) { 
//        
//    }
//}

//class Foo {
//    var numbers: [Int] = [1, 2, 3]
//}
//
//let foo = Foo()
//print(foo.numbers)//[1, 2, 3]
//var numbers = foo.numbers
//print(numbers)//[1, 2, 3]
//foo.numbers = [4,5,6]
//print(foo.numbers)//[4, 5, 6]
//print(numbers)//[1, 2, 3]
//numbers = [7,8,9]
//print(numbers)//[7, 8, 9]
//
//let foo1 = foo
//print(foo1.numbers)//[4, 5, 6]
//foo1.numbers = [0,1,1]
//print(foo1.numbers)//[0, 1, 1]
//print(foo.numbers)//[0, 1, 1]

