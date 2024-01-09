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
        case load
        case presentMyProfileView
        case presentOtherProfileView(String)
    }
    
    @Published var myUser: User?
    @Published var users: [User] = []//[.stub1, .stub2]
    @Published var phase: Phase = .notRequested
    @Published var modalDestination: HomeModalDestination?
    
    private var userId: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
            case .load:
                phase = .loading
                container.services.userService.getUser(userId: userId)
                    .handleEvents ( receiveOutput: { [weak self] user in
                        self?.myUser = user
                    })
                    .flatMap { user in
                        self.container.services.userService.loadUsers(userId: user.id)
                    }
                    .sink { [weak self] completion in
                        if case .failure = completion {
                            self?.phase = .fail
                        }
                    } receiveValue: { [weak self] users in
                        self?.phase = .success
                        self?.users = users
                    }
                    .store(in: &subscriptions)
                
            case .presentMyProfileView:
                modalDestination = .myProfile
            case .presentOtherProfileView(let userId):
                modalDestination = .otherProfile(userId)
        }
    }
}
