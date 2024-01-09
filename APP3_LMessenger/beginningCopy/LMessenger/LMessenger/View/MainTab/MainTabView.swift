//
//  MainTabView.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/21/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var container: DIContainer
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                        case .home:
                            HomeView(viewModel: .init(container: container, userId: authViewModel.userId ?? ""))
                        case .chat:
                            ChatListView()
                        case .phone:
                            Color.blackFix
                    }
                }
                .tabItem {
                    Label(tab.title, image: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        }
        .tint(Color.bkText)
    }
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.bkText)
    }
}

//#Preview {
//    let container = DIContainer(services: StubService())
//    MainTabView()
//        .environmentObject(container)
//        .environmentObject(AuthenticationViewModel(container: container))
//}
struct MainTabView_Previews: PreviewProvider {
    static let container: DIContainer = DIContainer(services: StubService())
    
    static var previews: some View {
        MainTabView()
            .environmentObject(Self.container)
            .environmentObject(AuthenticationViewModel(container: Self.container))
    }
}
