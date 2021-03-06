/*
 * Copyright (C) 2016 Fred Rajaona
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

/******* AppleScript use ********
 
 tell application "LiFXController"
    offLights {"group", "Chambre"}
 end tell
 
 *********************************/

class OffLights: NSScriptCommand {
    override func performDefaultImplementation() -> Any? {
        
        if let directArgument = directParameter, let arguments = directArgument as? [String] , arguments.count > 0 {
            print("running OffLights command with string args: \(directArgument)")
            if arguments[0] == "group" {
                for index in 1 ..< arguments.count {
                    LiFXDeviceManager.sharedInstance.switchOffGroup(arguments[index])
                }
            } else {
                for index in 0 ..< arguments.count {
                    LiFXDeviceManager.sharedInstance.switchOff(arguments[index])
                }
            }
        }
        return nil
    }
}
