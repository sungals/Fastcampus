//
//  AuthenticatedView.swift
//  LMessenger
//
//

import SwiftUI

struct AuthenticatedView: View {
    
    @StateObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
        switch authViewModel.authenticationState {
            case .unauthenticated:
                LoginIntroView()
            case .authenticated:
                MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView(authViewModel: .init(container: .init(service: StubService())))
    }
}
