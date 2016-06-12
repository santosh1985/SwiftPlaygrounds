
import XCPlayground
import Foundation
import UIKit
//=============================================================

extension Int {
    
    //Binary String
    var toBinaryString: String {
        return String(self, radix:2)
    }
    
    //Hex String
    var toHexaString: String {
        return String(self, radix: 16)
    }
}

//create an inter variable
let number = 9
print(number)
print(number.toBinaryString)
print(number.toHexaString)
