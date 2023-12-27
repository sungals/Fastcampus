//
//  DIContainer.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/20/23.
//

import Foundation

/// 앱 외부에서 주입되어야하는 정보나 로직을 관리
class DIContainer: ObservableObject {
    // TODO: service
    
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
    
}
