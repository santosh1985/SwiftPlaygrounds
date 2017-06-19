//: Playground - noun: a place where people can play

import UIKit
import Foundation

//var numberList = [1,2,3,4,5,6,7,8,9,10]
//func linearSearch(key: Int) -> Bool {
//    var found = false
//    for item in numberList {
//        if key == item {
//            found = true
//        }
//    }
//    return found
//}

//linearSearch(3)
//=========================================================
///binary search

//func bSearch(arr: [Int], left: Int, right: Int, key: Int) -> Int {
//    if right >= left {
//        var mid = left + (right - left)/2
//        if arr[mid] == key {
//            return mid
//        }
//        if arr[mid] > key {
//            return bSearch(arr, left: left, right: mid - 1, key: key)
//        }
//        return bSearch(arr, left: mid + 1, right: right, key: key)
//    }
//    return -1
//}
//let arr = [1,2,3,4,5,6,7,8,9,10]
//let result = bSearch(arr, left: 0, right: 9, key: 10)
//print("item is present at index -> \(result)")

//=========================================================

//MARK: Imsertion Sort
//func insertionSort() {
//    var key: Int
//    for var i = 0; i < numberList.count; i += 1 {
//        key = numberList[i]
//        for var j = i; j > -1; j -= 1 {
//            if key < numberList[j] {
//                numberList.removeAtIndex(j+1)
//                numberList.insert(key, atIndex: j)
//            }
//        }
//    }
//}

//insertionSort()
//var sort = [1,22,43,-4,95,6,17,8,9,10]
//=========================================================
//MARK: Bubble Sort
//func bubbleSort() {
//    for var i = 0; i < sort.count - 1; i += 1 {
//        for var j = 0; j < sort.count - i - 1; j += 1 {
//            if sort[j] > sort[j + 1] {
//                var temp = sort[j]
//                sort[j] = sort[j + 1]
//                sort[j + 1] = temp
//            }
//        }
//    }
//    print("Bubble Sort results:")
//    for i in sort {
//        print(i)
//    }
//}
//bubbleSort()


//=========================================================

//MARK: QuickSort

//func quickSort(var a: [Int], left: Int, right: Int) {
//    var j: Int
//    if left <= right {
//        j = partition(a, left: left, right: right)
//        quickSort(a, left: left, right: j - 1)
//        quickSort(a, left: j + 1, right: right)
//    }
//    for i in a {
//        print(i)
//    }
//}
//
//func partition(var a: [Int], left: Int, right: Int) -> Int {
//    var pivot: Int, i: Int, j: Int, temp: Int
//    pivot = a[left]
//    i = left
//    j = right
//    while i < j {
//        while a[i] <= pivot && i <= right {
//            i += 1
//        }
//        while a[j] > pivot {
//            j -= 1
//        }
//        if i >= j {
//            break
//        }
//        temp = a[i]
//        a[i] = a[j]
//        a[j] = temp
//    }
//    temp = a[left]
//    a[left] = a[j]
//    a[j] = temp
//    return j
//}
//
//var sort1 = [1,22,43,-4,95,6,17,8,9,10]
//quickSort(sort1, left: 0, right: 8)
//print(sort1)

//func quickSort(var a: [Int], low: Int, high: Int) {
//    var pivot: Int, i: Int, j: Int, temp: Int
//    if low < high {
//        pivot = low
//        i = low
//        j = high
//        while i < j {
//            while a[i] <= a[pivot] && i <= high {
//                i++
//            }
//            while a[j] > a[pivot] && j >= low {
//                j--
//            }
//            
//            if i < j {
//                temp = a[i]
//                a[i] = a[j]
//                a[j] = temp
//            }
//        }
//        
//        temp = a[j]
//        a[j] = a[pivot]
//        a[pivot] = temp
//        
//        quickSort(a, low: low, high: j - 1)
//        quickSort(a, low: j + 1, high: high)
//    }
//    
//    print("First1")
//    for i in a {
//        print(i)
//    }
//}
//
//let arr = [90, 34, 21, -9, 4, 88, 56]
//quickSort(arr, low: 0, high: arr.count - 2)

//func mergeSort(a: [Int]) {
//    let n = a.count
//    var L = [Int](), R = [Int](), mid: Int, i: Int
//    if n < 2 {
//        return
//    }
//    mid = n/2
//    for i = 0; i < mid; i += 1 {
//        L[i] = a[i]
//    }
//    for i = mid; i < n; i += 1 {
//        R[i - mid] = a[i]
//    }
//    mergeSort(L)
//    mergeSort(R)
//    merge(a, l: L, r: R)
//}
//
//func merge(a:[Int], l: [Int], r: [Int]) -> [Int] {
//    var arr = [Int]()
//    
//    for i in l {
//        arr.append(i)
//    }
//    for j in r {
//        arr.append(j)
//    }
//    return arr
//}

//let arr = [90, 34, 21, -9, 4, 88, 56]
//mergeSort(arr)

var imageview = UIImageView()

if let image = imageview.image {
    print("image")
}else{
    print("No image")
}

let field = UITextField()

if let s = field.text where s.characters.count > 0 {
    print("greater")
}else{
    print("no text")
}

