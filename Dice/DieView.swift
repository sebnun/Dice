//
//  DieView.swift
//  Dice
//
//  Created by Sebastian on 4/4/16.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import AppKit

class DieView: NSView {
    
    var intValue: Int? = 2 {
        didSet {
            needsDisplay = true
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        
        let backgroundColor = NSColor.lightGrayColor()
        backgroundColor.set()
        NSBezierPath.fillRect(bounds)
        
        drawDieWithSize(bounds.size)
    }
    
    func metricForSize(size: CGSize) -> (edgeLength: CGFloat, dieFrame: CGRect) {
        
        let edgeLenght = min(size.width, size.height)
        let padding = edgeLenght/10.0
        let drawingBounds = CGRect(x: 0, y: 0, width: edgeLenght, height: edgeLenght)
        
        let dieFrame = drawingBounds.insetBy(dx: padding, dy: padding)
        
        return (edgeLenght, dieFrame)
    }
    
    func drawDieWithSize(size: CGSize) {
        
        if let intValue = intValue {
            
            let (edgeLenght, dieFrame) = metricForSize(size)
            let cornerRadius: CGFloat = edgeLenght/5.0
            let dotRadius = edgeLenght/12.0
            let dotFrame = dieFrame.insetBy(dx: dotRadius * 2.5, dy: dotRadius * 2.5)
            
            NSColor.whiteColor().set()
            NSBezierPath(roundedRect: dieFrame, xRadius: cornerRadius, yRadius: cornerRadius).fill()
            
            //nested function to make drwaing dots cleaner
            func drawDot(u: CGFloat, v:CGFloat) {
                let dotOrigin = CGPoint(x: dotFrame.minX + dotFrame.width * u, y: dotFrame.minY + dotFrame.height * v)
                let dotRect = CGRect(origin: dotOrigin, size: CGSizeZero).insetBy(dx: -dotRadius, dy: -dotRadius)
                NSBezierPath(ovalInRect: dotRect).fill()
            }
            
            if (1...6).indexOf(intValue) != nil {
                // Draw the dots:
                if [1, 3, 5].indexOf(intValue) != nil {
                    drawDot(0.5, v: 0.5) // Center dot
                }
                if (2...6).indexOf(intValue) != nil {
                    drawDot(0, v: 1) // Upper left
                    drawDot(1, v: 0) // Lower right
                }
                if (4...6).indexOf(intValue) != nil {
                    drawDot(1, v: 1) // Upper right
                    drawDot(0, v: 0) // Lower left
                }
                if intValue == 6 {
                    drawDot(0, v: 0.5) // Mid left/right
                    drawDot(1, v: 0.5)
                }
            }
        }
    }
}