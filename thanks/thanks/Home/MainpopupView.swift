//
//  Popup.swift
//  thanks
//
//  Created by Jiha Kim on 4/14/25.
//

import SwiftUI

struct Popup: View {
    @Binding var isPresented: Bool
    var nickname: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            VStack {
                // 닫기 버튼
                HStack {
//                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 24)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }

                VStack {
                    Text("기억하시나요?")
                        .font(.pretendardBold16)
                        .foregroundColor(.bluep)
                        .padding(.bottom, 12)

                    VStack(spacing: 4) {
                        Text("234일 전 \(nickname)님은")
                            .font(.pretendardBold20)
                            .foregroundColor(.black)
                        Text("이러한 감사를 느꼈어요")
                            .font(.pretendardBold20)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 30)

                    Image("popup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 146, height: 146)
                }
                .padding(.bottom, 30)

                Button(action: {
                   isPresented = false
                }) {
                    Text("확인하러 가기")
                        .font(.pretendardSemiBold16)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .background(Color.yellowp)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 24)

            }
            .padding(.vertical, 24)
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal, 32)
        }
    }
}


#Preview {
    StatefulPreviewWrapper(true) { isPresented in
        Popup(isPresented: isPresented, nickname: "스노우")
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
