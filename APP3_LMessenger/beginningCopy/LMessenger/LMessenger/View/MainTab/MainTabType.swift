//
//  MainTabType.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/27/23.
//

import Foundation

enum MainTabType: String, CaseIterable {
    case home
    case chat
    case phone
    
    var title: String {
        switch self {
            case .home:
                return "홈"
            case .chat:
                return "채팅"
            case .phone:
                return "통화"
        }
    }
    
    func imageName(selected: Bool) -> String {
        selected ? "\(rawValue)_fill" : rawValue
    }
}
