//
//  Constant.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 1/3/24.
//

import Foundation

typealias DBKey = Constant.DBKey

enum Constant {}

extension Constant {
    struct DBKey {
        static let Users = "Users"
        static let ChatRooms = "ChatRooms"
        static let Chats = "Chats"
    }
}
