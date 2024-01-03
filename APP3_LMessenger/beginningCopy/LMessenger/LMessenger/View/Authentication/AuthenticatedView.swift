//
//  AuthenticatedView.swift
//  LMessenger
//
//

import SwiftUI

struct AuthenticatedView: View {
    
    @StateObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
        VStack {
            switch authViewModel.authenticationState {
                case .unauthenticated:
                    LoginIntroView()
                        .environmentObject(authViewModel)
                case .authenticated:
                    MainTabView()
                        .environmentObject(authViewModel)
            }
        }
        .onAppear() {
            authViewModel.send(action: .checkAuthenticationState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView(authViewModel: .init(container: .init(services: StubService()), isLoading: false))
    }
}
