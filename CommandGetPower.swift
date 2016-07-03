//
//  CommandGetPower.swift
//  LiFXController
//
//  Created by Fred Rajaona on 25/12/2015.
//  Copyright © 2015 Fred Rajaona. All rights reserved.
//

import Foundation

final class CommandGetPower: Command {
    
    var sequenceNumber: UInt8 = 0
    var sourceNumber: UInt32 = 0
    
    private var transmitProtocolHandler: TransmitProtocolHandler!
    
    private var message: LiFXMessage!
    
    func initCommand(transmitProtocolHandler: TransmitProtocolHandler) {
        self.transmitProtocolHandler = transmitProtocolHandler
        message = LiFXMessage(messageType: LiFXMessage.MessageType.LightGetPower, sequenceNumber: sequenceNumber, sourceNumber: sourceNumber,targetAddress: (UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)), messagePayload: nil)
    }
    
    func getMessage() -> LiFXMessage {
        return message
    }
    
    func getProtocolHandler() -> TransmitProtocolHandler {
        return transmitProtocolHandler
    }
}