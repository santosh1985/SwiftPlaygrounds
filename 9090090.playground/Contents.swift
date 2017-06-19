//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport
var runCounter = 0
class MyView: UIView {
    override func draw(_ rect: CGRect) {
        if runCounter == 1 {
            
            UIColor.black.setFill()
            backgroundColor = UIColor.red
            
            print(runCounter)  //debugging
            print(self.bounds) //debugging
            UIBezierPath(rect: self.bounds).fill()
            print(backgroundColor)
        }
    }
}

let view = MyView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
PlaygroundPage.current.liveView = view
Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {timer in
    view.setNeedsDisplay()
    runCounter += 1
})



