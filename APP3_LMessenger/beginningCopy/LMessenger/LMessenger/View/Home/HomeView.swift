//
//  HomeView.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/27/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}
