
import XCPlayground
import Foundation
import UIKit
//=============================================================

extension Int {
    
    //Binary String
    var binaryString: String {
        return String(self, radix:2)
    }
    
    //Hex String
    var hexString: String {
        return String(self, radix: 16)
    }
}

//create an inter variable
let number = 9
print(number)
print(number.binaryString)
print(number.hexString)
