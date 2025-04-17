//
//  FirstPopView.swift
//  thanks
//
//  Created by Jiha Kim on 4/16/25.
//

import SwiftUI

struct SaveCompletePopup: View {
    @Binding var isPresented: Bool
    var onConfirm: () -> Void
    var onDoNotShowAgain: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            
            VStack {
                // 닫기 버튼
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 14)
                    }
                }
                
                VStack {
                    // 이미지
                    Image("first")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 20)
                    
                    // 저장완료
                    Text("저장완료!")
                        .font(.pretendardSemiBold18)
                        .foregroundColor(.black)
                        .padding(.bottom, 12)
                    
                    // 텍스트
                    Text("지금 남긴 고마움은 언젠가\n따뜻한 순간으로 돌아올 거예요")
                        .font(.pretendardMedium15)
                        .foregroundColor(.gray2)
                        .multilineTextAlignment(.center)
                        .lineSpacing(6)
                        .padding(.bottom, 24)
                }
                
                // 확인 버튼
                Button(action: {
                    onConfirm()
                    isPresented = false
                }) {
                    Text("확인")
                        .font(.pretendardSemiBold15)
                        .foregroundColor(.black)
                        .frame(width: 276, height: 50)
                        .background(Color.yellowp)
                        .cornerRadius(8)
                }
                
                // 다시 보지 않기
                Button(action: {
                    //onDoNotShowAgain()
                    //isPresented = false
                }) {
                    Text("다시 보지 않기")
                        .font(.pretendardMedium14)
                        .foregroundColor(.gray3)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .frame(maxWidth: 320)
            .frame(maxHeight: 370)
        }
    }
}



#Preview {
    SaveCompletePopup(
        isPresented: .constant(true),
        onConfirm: { },
        onDoNotShowAgain: { }
    )
}
