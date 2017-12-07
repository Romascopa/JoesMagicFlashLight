//
//  SwitchStatus.swift
//  FlashLightApp
//
//  Created by Lance Robbins on 12/6/17.
//  Copyright © 2017 Appcation. All rights reserved.
//

import Foundation

enum SwitchStatus: Togglable {
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
            
        }
    }
    
    case on, off
    
    
}
