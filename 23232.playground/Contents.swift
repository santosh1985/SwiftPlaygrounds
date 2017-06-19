//: Playground - noun: a place where people can play

import UIKit

//class StrArrange {
//    struct CharFreq {
//        var char: Character
//        var frequency: Int
//    }
//    
//    func swap(inout left: CharFreq, inout right: CharFreq)  {
//        let temp = left
//        left = right
//        right = temp
//    }
//    
//    func maxHeapify(var freq: [CharFreq], i: Int, heapSize: Int) {
//        let l = i * 2 + 1
//        let r = i * 2 + 2
//        var largest = i
//        if l < heapSize && freq[l].frequency > freq[i].frequency {
//            largest = l
//        }
//        if r < heapSize && freq[r].frequency > freq[largest].frequency {
//            largest = r
//        }
//        if largest != i {
//            swap(&freq[i], right: &freq[largest])
//            maxHeapify(freq, i: largest, heapSize: heapSize)
//        }
//    }
//    
//    func buildHeap(freq: [CharFreq], n: Int) {
//        var i = (n - 1)/2
//        while i >= 0 {
//            maxHeapify(freq, i: i, heapSize: n)
//            i -= 1
//        }
//    }
//    
//    func extractMax(var freq: [CharFreq], heapSize: Int) -> CharFreq {
//        let root = freq[0]
//        if heapSize > 1 {
//            freq[0] = freq[heapSize - 1]
//            maxHeapify(freq, i: 0, heapSize: heapSize - 1)
//        }
//        return root
//    }
//    
//    func rearrange(str: [Character], d: Int) {
//        let n = str.count
//        var freq = [CharFreq]()
//        var m = 0
//        for var i = 0; i < n; i += 1 {
//            var x = str[i]
//            if freq[x].char == "" {
//                
//            }
//        }
//    }
//}

//let str = "My name is X Y Z"
//var rev = [Character]()
//for char in str.characters.reverse() {
//    debugPrint(char)
//}

class Item {
    var id:Int
    var header:String
    var detail: String?
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
            let header = dictionary["header"] as? String else {
                return nil
        }
        self.id = id
        self.header = header
        self.detail = dictionary["detail"] as? String
    }
}

//let dictionary = ["id": 10, "header": "HeaderValue", "detail":"DetailValue"]
//var items = [Item]()
//if let item = Item(dictionary: dictionary) {
//    items.append(item)
//    
//    print(item.id)
//    print(item.detail ?? "'detail' is nil for this item")
//    print(item.header)
//}else{
//    print("No Item created!")
//}
//

import Foundation

//func sessionTask () -> URLSessionDataTask {
//    let request = NSMutableURLRequest()
//    let session = NSURLSession.sharedSession()
//    var task: URLSessionDataTask
//    task = session.dataTask(with: request) { (data, response, error) in
//        if error == nil {
//            if let response = response as? HTTPURLResponse {
//                let results = self.parseHeader(response)
//                print("Results: \(results)")
//                if results.isServer == true {
//                    completionBlock(data: data, httpResponse: response, validServer: results.isServer, serverRealm: results.realm, serverVersion: results.serverVersion)
//                }
//            }
//        } else {
//            failureBlock?(data: data, response: response, error: error)
//        }
//    }
//    
////    task.taskDescription = Paths.ping.rawValue
//    task.resume()
//    return task
//}

//var array = [UInt]()
//array = [2,3,4,5,6]
//print(array.count)

//infix operator > { associativity left precedence 160 }
//
//func >(lhs: <T>, rhs: <T>) {
//    
//}

struct TimeMark: OptionSetType {
    
    private enum TimeMark : Int,CustomStringConvertible {
        case Header=0, Current=1
        
        var description : String {
            var shift = 0
            while (rawValue >> shift != 1){ shift += 1 }
            return ["Header", "Current"][shift]
        }
    }
    
    let rawValue: Int
    
    internal init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    private init(_ timeMark: TimeMark){
        self.rawValue = timeMark.rawValue
    }
    
    static let Header = 0
    static let Current = 1
    
}

let mark = TimeMark()
let rounded = (mark.rawValue == TimeMark.Current)

import AppKit

let i = NSMenuitem()
