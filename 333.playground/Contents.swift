//: Playground - noun: a place where people can play

import UIKit
import Foundation

class BST <T: Comparable> {
    var key: T?
    var left: BST?
    var right: BST?
    
    //add item based on its value
    func addNode(key: T) {
        //check for the head node
        if self.key == nil {
            self.key = key
            return
        }
        
        //check the left side of the tree
        if key < self.key {
            if self.left != nil {
                left?.addNode(key)
            }else{
                //create a new left node
                let leftChild = BST()
                leftChild.key = key
                self.left = leftChild
            }
        }
        
        //check the right side of the tree
        if key > self.key {
            if self.right != nil {
                right?.addNode(key)
            }else{
                //create a new right node
                let rightChild = BST()
                rightChild.key = key
                self.right = rightChild
            }
        }
    }
}

let numberList = [8, 2, 10, 9, 11, 1, 7]

let bst = BST<Int>()

for num in numberList {
    bst.addNode(num)
}

class LLNode<T> {
    var key: T?
    var next: LLNode?
}

class Student {
    var name: String?
    var score: Int?
}
var studentList = LLNode<Student>()

//Mirror
let lotteryTouple = (4,8,15,16,23,42)
let lotteryMirror = Mirror(reflecting: lotteryTouple)
var lotterArray = [Int]()

for child in lotteryMirror.children {
    let (index, mirror) = child
    if let number = mirror as? Int {
        lotterArray.append(number)
    }
}

lotterArray.removeAtIndex(<#T##index: Int##Int#>)
//print(lotterArray)

//Tries

class TrieNode {
    var key: String!
    var children: [TrieNode]!
    var isFinal: Bool!
    var level: Int!
    
    init() {
        self.children = [TrieNode]()
        self.isFinal = false
        self.level = 0
    }
}

class Trie {
    
    private var root: TrieNode!
    
    init() {
        root = TrieNode()
    }
    
    func addWord(keyword: String) {
        
        if keyword.characters.count == 0 {
            return
        }
        
        var current = root
        var searchKey: String!
        
        while keyword.characters.count != current.level {
            var childToUse: TrieNode!
            searchKey = (keyword as NSString).substringToIndex(current.level + 1)
            for child in current.children {
                if child.key == searchKey {
                    childToUse = child
                    break
                }
            }
            
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
        }
        
        if keyword.characters.count == current.level {
            current.isFinal = true
            print("End of word reached!")
            return
        }
    }
    
    //Find all words based on a prefix
    func findWord(keyword: String) -> [String]? {
        
        if keyword.characters.count == 0 {
            return nil
        }
        
        var current = root
        var searchKey: String!
        var wordList = [String]()
        
        while keyword.characters.count != current.level {
            var childToUse: TrieNode!
            searchKey = (keyword as NSString).substringToIndex(current.level + 1)
            
            //iterate through any children
            for child in current.children {
                if child.key == searchKey {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            //prefix not found
            if childToUse == nil {
                return nil
            }
        }//end while
        
        //retrieve keyword and any decendants
        if current.key == keyword && current.isFinal {
            wordList.append(current.key)
        }
        
        //add children that are words
        for child in current.children {
            if child.isFinal == true {
                wordList.append(child.key)
            }
        }
        
        return wordList
    }
    
}

var trie = Trie()
trie.addWord("Ball")
trie.addWord("Balls")
trie.addWord("Ballard")
trie.addWord("Bat")
trie.addWord("Ban")
trie.addWord("Bar")

print(trie.findWord("Ba"))

