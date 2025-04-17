//
//  WriteCompleteView.swift
//  thanks
//
//  Created by Jiha Kim on 4/17/25.
//

import SwiftUI

struct WriteCompleteView: View {
    let dateString: String
    let title: String
    let content: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 날짜
            Text(dateString)
                .font(.pretendardSemiBold24)
                .padding(.top, 60)
                .padding(.horizontal, 24)
                .padding(.bottom, 28)

            // 제목
            VStack(alignment: .leading, spacing: 8) {
                Text("제목")
                    .font(.pretendardSemiBold16)
                    .foregroundColor(.gray2)

                Text(title)
                    .font(.pretendardMedium14)
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray5)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 44)

            // 내용
            VStack(alignment: .leading, spacing: 8) {
                Text("내용")
                    .font(.pretendardSemiBold16)
                    .foregroundColor(.gray2)

                Text(content)
                    .font(.pretendardMedium14)
                    .foregroundColor(.black)
                    .frame(minHeight: 180, alignment: .topLeading)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray5)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)

            Spacer()

            // 하단 버튼
            Button(action: {
                onDismiss()
            }) {
                Text("홈으로")
                    .font(.pretendardSemiBold18)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.yellowp)
            }
            .padding(.bottom, 32)
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    WriteCompleteView(
        dateString: "4월 9일 수요일",
        title: "나에게 감사함",
        content: "오늘 나 혼자 되게 열심히 작업해서 나 자신에게 너무나 고마웠다. 나 자신 칭찬해 대단함!!!!",
        onDismiss: {}
    )
}
