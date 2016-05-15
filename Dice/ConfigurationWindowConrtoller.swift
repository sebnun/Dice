//
//  ConfigurationWindowConrtoller.swift
//  Dice
//
//  Created by Sebastian on 5/15/16.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import Cocoa
struct DieConfiguration {
    let color: NSColor
    let rolls: Int
}

class ConfigurationWindowController: NSWindowController {
    
    var configuration: DieConfiguration {
        set {
            color = newValue.color
            rolls = newValue.rolls
        }
        get {
            return DieConfiguration(color: color, rolls: rolls)
        }
    }
    
    private dynamic var color: NSColor = NSColor.whiteColor()
    private dynamic var rolls: Int = 10
    
    override var windowNibName: String {
        get {
            return "ConfigurationWindowConrtoller"
        }
    }
    
    @IBAction func okayButtonClicked(button: NSButton) {
        dismissWithModalResponse(NSModalResponseOK)
    }
    
    @IBAction func cancelButtonClicked(button: NSButton) {
        dismissWithModalResponse(NSModalResponseCancel)
    }
    
    func dismissWithModalResponse(response: NSModalResponse) {
        window!.sheetParent!.endSheet(window!, returnCode: response)
    }
    
}