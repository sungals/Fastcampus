//
//  LoginView.swift
//  LMessenger
//
//  Created by SEONG MIN HAN on 12/21/23.
//

import SwiftUI

struct LoginView: View {
    @State private var isPresentedGoogleView: Bool = false
    @State private var isPresentedAppleView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("로그인")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.bkText)
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 10, trailing: 0))
            Text("아래 제공되는 서비스로 로그인을 해주세요.")
                .font(.system(size: 14))
                .foregroundColor(.greyDeep)
                .padding(.leading, 30)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Google로 로그인")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.bkText)
                    .frame(maxWidth: .infinity, maxHeight: 40)
            })
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.greyLight, lineWidth: 0.8)
            }
            .padding(20)
            .navigationDestination(isPresented: $isPresentedGoogleView) {
                
            }
            
            Button(action: {
                
            }, label: {
                Text("Apple로 로그인")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.bkText)
                    .frame(maxWidth: .infinity, maxHeight: 40)
            })
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.greyLight, lineWidth: 0.8)
            }
            .padding(20)
            .navigationDestination(isPresented: $isPresentedAppleView) {
            }
        }
    }
}

#Preview {
    LoginView()
}
