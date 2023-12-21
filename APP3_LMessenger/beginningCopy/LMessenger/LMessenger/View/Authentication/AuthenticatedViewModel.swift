//
//  AuthenticatedViewModel.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/20/23.
//

import Foundation

enum AuthenticationState {
    case unauthenticated
    case authenticated
}


/// 인증을 담당하는 역할
class AuthenticatedViewModel: ObservableObject {

    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    } 
    
}
