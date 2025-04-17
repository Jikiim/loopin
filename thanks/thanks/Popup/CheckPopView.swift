//
//  CheckPopView.swift
//  thanks
//
//  Created by Jiha Kim on 4/16/25.
//

import SwiftUI

struct CustomAlertView: View {
    var title: String
    var message: String
    var cancelTitle: String
    var confirmTitle: String
    var onCancel: () -> Void
    var onConfirm: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.pretendardSemiBold16)
                .foregroundColor(.black)
                .padding(.top, 24)
            
            Text(message)
                .font(.pretendardMedium14)
                .foregroundColor(.gray3)
                .padding(.bottom, 22)
            
            HStack(spacing: 8) {
                Button(action: onCancel) {
                    Text(cancelTitle)
                        .font(.pretendardMedium14)
                        .foregroundColor(.gray3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.gray6)
                        .cornerRadius(8)
                }
                
                Button(action: onConfirm) {
                    Text(confirmTitle)
                        .font(.pretendardMedium14)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.yellowp)
                        .cornerRadius(8)
                }
            }
            .padding(.bottom, 18)
            .padding(.horizontal, 18)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 10)
        .frame(maxWidth: 327)
    }
}


//#Preview {
//    CustomAlertView(
//        title: "정말 일기를 삭제할까요?",
//        message: "삭제한 일기는 다시 확인할 수 없어요.",
//        cancelTitle: "아니요",
//        confirmTitle: "삭제하기",
//        onCancel: { print("취소") },
//        onConfirm: { print("삭제 완료") }
//    )
//}
