//
//  Onboarding.swift
//  thanks
//
//  Created by Jiha Kim on 4/13/25.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
                Spacer()
            
                Text("반가워요! 지금부터\n고마움을 기록해볼까요?")
                    .font(.pretendardBold24)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
            VStack(spacing: 10) {
                Text("오늘의 고마움을 ")
                    .foregroundColor(.gray2)
                + Text("기록")
                    .foregroundColor(.bluep)
                + Text("해서\n내일의 내가 ")
                    .foregroundColor(.gray2)
                + Text("기억")
                    .foregroundColor(.bluep)
                + Text("할 수 있게")
                    .foregroundColor(.gray2)
            }
                .font(.pretendardSemiBold16)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding(.horizontal, 24)
                .padding(.bottom, 70)
            
            
            Image("onboardingimg")
                .resizable()
                .scaledToFit()
                .frame(height: 270)
                .padding(.bottom, 120)
            
            Button(action: {
                print("이거 눌림")       // 버튼 누르면 실행할 액션 (지금은 비워둠)
            }) {
                Text("다음")
                    .font(.pretendardSemiBold18)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .padding(20)
                    .background(.yellowp)
                    .cornerRadius(8)
                
            }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
    }

#Preview {
    Onboarding()
}
