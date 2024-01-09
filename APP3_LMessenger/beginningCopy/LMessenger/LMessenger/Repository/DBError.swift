//
//  DBError.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 1/2/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
    case invalidateType
}
