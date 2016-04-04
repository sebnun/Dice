//
//  DieView.swift
//  Dice
//
//  Created by Sebastian on 4/4/16.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import AppKit

class DieView: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        
        let backgroundColor = NSColor.lightGrayColor()
        backgroundColor.set()
        NSBezierPath.fillRect(bounds)
        
        NSColor.greenColor().set()
        let path = NSBezierPath()
        path.moveToPoint(NSPoint(x: 0, y: 0))
        path.lineToPoint(NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
    }
}