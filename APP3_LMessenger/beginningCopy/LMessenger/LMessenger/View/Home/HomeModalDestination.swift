//
//  HomeModalDestination.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 1/9/24.
//

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    
    var id: Int {
        hashValue
    }
}
