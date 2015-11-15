//
//  ConsolesManager.swift
//  ogl
//
//  Created by John Uribe Mendoza on 14/11/15.
//  Copyright © 2015 GeekCode. All rights reserved.
//

import UIKit

public class ConsolesManager: NSObject {
    
    public func preloadConsoles () -> NSArray {
        var consoles: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("Consoles", ofType: "plist") {
            consoles = NSArray(contentsOfFile: path)
        }
        return consoles!
    }
}
