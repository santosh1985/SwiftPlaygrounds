//: Playground - noun: a place where people can play

import UIKit

//=====================

struct Stack<Element> {
    var items = [Element]()
    
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
