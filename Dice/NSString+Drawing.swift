//
//  NSString+Drawing.swift
//  Dice
//
//  Created by Sebastian on 5/14/16.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import Cocoa

extension NSString {
    
    func drawCenteredInRect(rect: NSRect, attributes: [String: AnyObject]?) {
        let stringSize = sizeWithAttributes(attributes)
        let stringOrigin = NSPoint(x: rect.origin.x + (rect.width - stringSize.width)/2.0,
                                   y: rect.origin.y + (rect.height - stringSize.height)/2.0)
        drawAtPoint(stringOrigin, withAttributes: attributes)
    }
}
