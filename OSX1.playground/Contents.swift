//: Playground - noun: a place where people can play

import Cocoa
import AppKit

let menu = NSMenuItem(title: "Test", action: "test", keyEquivalent: "K")
print(menu.title)
menu.attributedTitle = NSAttributedString(string: "Test", attributes: [NSFontAttributeName: NSFont.systemFontSize(), NSForegroundColorAttributeName: NSColor.redColor()])
print(menu.title)

let menuItem = NSMenuItem()
menuItem.attributedTitle = NSAttributedString(string: "Test", attributes: [NSFontAttributeName: NSFont.systemFontSize(), NSForegroundColorAttributeName: NSColor.redColor()])
menuItem.target = self
menuItem.action = Selector("test")
menuItem.keyEquivalent = "T"

func test() {
    
}