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
                profileView
                    .padding(.vertical, 30)
                
                searchView
                    .padding(.bottom, 24)
                
                HStack {
                    Text("친구")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.bkText)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                
                // TODO: 친구목록
                if viewModel.users.isEmpty {
                    Spacer(minLength: 89)
                    emptyView
                } else {
                    ForEach(viewModel.users, id: \.id) { user in
                        HStack(spacing: 8) {
                            Image("person")
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            Text(user.name)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.bkText)
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                    }
                }
            }
            .toolbar {
                Image("bookmark")
                Image("notifications")
                Image("person_add")
                Button(action: {
                    // TODO:
                }, label: {
                    Image("settings")
                })
            }
            .onAppear {
                viewModel.send(action: .getUser)
            }
        }
    }
    
    
    var emptyView: some View {
        VStack {
            VStack(spacing: 3) {
                Text("친구를 추가해보세요.")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.bkText)
                Text("큐알코드나 검색을 이용해서 친구를 추가해보세요.")
                    .font(.system(size: 14))
                    .foregroundColor(.greyDeep)
            }
            .padding(.bottom, 30)
            
            
            Button {
                // TODO: 친구추가
            } label: {
                Text("친구 추가")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.bkText)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 25)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.greyLight, lineWidth: 1)
            }
        }
    }
    
    var searchView: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.greyCool)
                .cornerRadius(5)
            
            HStack {
                Text("검색")
                    .font(.system(size: 12))
                    .foregroundColor(.greyLightVer2)
                
                Spacer()
            }
            .padding(.leading, 22)
        }
        .padding(.horizontal, 30)
    }
    
    var profileView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.myUser?.name ?? "이름")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.bkText)
                
                Text(viewModel.myUser?.description ?? "상태 메시지 입력")
                    .font(.system(size: 12))
                    .foregroundColor(.greyDeep)
            }
            
            Spacer()
            
            Image("person")
                .resizable()
                .scaledToFit()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    HomeView(viewModel: .init(container: .init(services: StubService()), userId: "user1_id"))
}
