//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/27/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var myUser: User?
    @Published var users: [User] = []//[.stub1, .stub2]
}
