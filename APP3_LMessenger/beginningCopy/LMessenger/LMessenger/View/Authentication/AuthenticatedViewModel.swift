//
//  AuthenticatedViewModel.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/20/23.
//

import Foundation
import Combine

enum AuthenticationState {
    case unauthenticated
    case authenticated
}


/// 인증을 담당하는 역할
class AuthenticatedViewModel: ObservableObject {

    enum Action {
        case googleLogin
    }
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    var userId: String?
    
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
    } 
    
    func send(action: Action) {
        switch action {
            case .googleLogin:
                container.services.authService.signInWithGoogle()
                    .sink { completion in
                        // TODO:
                    } receiveValue: { [weak self] user in
                        self?.userId = user.id
                        self?.authenticationState = .authenticated
                    }.store(in: &subscriptions)
        }
    }
}
