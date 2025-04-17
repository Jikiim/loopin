//
//  NoteCell.swift
//  thanks
//
//  Created by Jiha Kim on 4/17/25.
//

import SwiftUI

struct NoteCell: View {
    let title: String
    let content: String
    let imageName: String
    var onMoreTap: (() -> Void)? = nil

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                HStack(alignment: .top, spacing: 20) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 8) {
                        Text(title)
                            .font(.pretendardSemiBold16)
                            .foregroundColor(.black)

                        Text(content)
                            .font(.pretendardMedium14)
                            .foregroundColor(.gray2)
                            .lineSpacing(4)
                            .lineLimit(nil)
                    }

                    Spacer(minLength: 0)
                }
            }

            // 케밥 버튼 (고정된 위치)
            Button(action: {
                onMoreTap?()
            }) {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.gray3)
                    .padding(12)
            }
        }
        .padding(20) // 전체 콘텐츠 안쪽 패딩!
        .frame(width: 327)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    NoteCell(
        title: "감사했다.!!",
        content: "ㅇㅐ",
        imageName: "1"
    )
    .padding()
    .background(Color.gray.opacity(0.1))
}

