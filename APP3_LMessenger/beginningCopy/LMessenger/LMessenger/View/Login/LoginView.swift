//
//  LoginView.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/21/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("로그인")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.bkText)
                    .padding(.top, 80)
                Text("아래 제공되는 서비스로 로그인을 해주세요.")
                    .font(.system(size: 14))
                    .foregroundColor(.greyDeep)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button(action: {
                authViewModel.send(action: .googleLogin)
            }, label: {
                Text("Google로 로그인")
            })
            .buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .greyDeep))
            
            
            Button(action: {
                // TODO: applp 로그인
            }, label: {
                Text("Apple로 로그인")
            })
            .buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .greyDeep))
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image("back")
                })
            }
        })
    }
}

#Preview {
    LoginView()
}
