//
//  ToggleLights.swift
//  LiFXController
//
//  Created by Fred Rajaona on 29/12/2015.
//  Copyright © 2015 Fred Rajaona. All rights reserved.
//

import Foundation

/******* AppleScript use ********
 
tell application "LiFXController"
    toggleLights {"group", "Chambre", "Salle"}
end tell
 
*********************************/

class ToggleLights: NSScriptCommand {
    override func performDefaultImplementation() -> AnyObject? {
        
        if let directArgument = directParameter, let arguments = directArgument as? [String] where arguments.count > 0 {
            print("running ToggleLights command with string args: \(directArgument)")
            if arguments[0] == "group" {
                for index in 1 ..< arguments.count {
                    LiFXDeviceManager.sharedInstance.toggleGroup(arguments[index])
                }
            } else {
                for index in 0 ..< arguments.count {
                    LiFXDeviceManager.sharedInstance.toggle(arguments[index])
                }
            }
        }
        return nil
    }
}