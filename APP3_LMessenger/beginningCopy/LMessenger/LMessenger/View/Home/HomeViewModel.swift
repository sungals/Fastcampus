//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/27/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    enum Action {
        case getUser
    }
    
    @Published var myUser: User?
    @Published var users: [User] = []//[.stub1, .stub2]
    
    private var userId: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
            case .getUser:
                container.services.userService.getUser(userId: userId)
                    .sink { completion in
                        // TODO:
                    } receiveValue: { [weak self] user in
                        self?.myUser = user
                    }.store(in: &subscriptions)

                return
        }
    }
}
