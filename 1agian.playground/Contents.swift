//: Playground - noun: a place where people can play

import UIKit

func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    var result = left
    for _ in 1..<right {
        result += left
    }
    
    return result
}

"a"*6

func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](count: left.count, repeatedValue: 0.0)
    for (i, _) in left.enumerate() {
        sum[i] = left[i] + right[i]
    }
    
    return sum
}

print([1,2] + [3,4])

infix operator ** {associativity left precedence 160}

func **(left: Double, right: Double) -> Double {
    return pow(left, right)
}

print(2**3)

prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

print(√15)


