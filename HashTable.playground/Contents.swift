//: Playground - noun: a place where people can play

import UIKit

/*
 NSHashTable is a general-purpose analogue of NSSet. Constrasted with the behavior of NSSet/NSMutableSet, NSHashTable has:
 NSSet/NSMutableSet holds strong references to members, which are tested for hashing and equality using the mathods hash and isEqual:
 NSHashTbale is mutable, without an immutable counterpart.
 NSHashTable can hold weak references to its members.
 NSHashTable can copy members on input.
 */
let hashTable = NSHashTable(options: .CopyIn)
hashTable.addObject("foo")
hashTable.addObject("bar")
hashTable.addObject(42)
print("\(hashTable.allObjects)")
hashTable.removeObject("bar")
print("\(hashTable.allObjects)")


/*
 NSMapTable is a general-purpose analogue of NSDictionary. Constrasted with the behavior of NSDictionary/NSMutableDictionary, NSMapTable has:
 NSDictionary/NSMutableDictionary copies keys, and holds strong references to their values.
 NSMapTable is mutable, without an immutable counterpart.
 NSMapTable can hold keys and values with weak references, in such a way that entries are removed when either the key or value is deallocated.
 NSMapTable can copy its values on input.
 NSMapTable can contain arbitrary pointers, and use pointer identity for equality and hashing checks.
 
 */

let mapTable = NSMapTable(keyOptions: .CopyIn, valueOptions: .CopyIn)
mapTable.setObject("foo", forKey: "bar")
print(mapTable.keyEnumerator().allObjects)
print(mapTable.keyEnumerator().nextObject())

//NSMapTable doesn't implement object subscripting, but it can trivially added in a category.

extension NSMapTable {
    subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        set {
            if newValue != nil {
                setObject(newValue, forKey: key)
            }else{
                removeObjectForKey(key)
            }
        }
    }
}

mapTable["bar"] //prints 'foo'
