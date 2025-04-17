//
//  NicknameView.swift
//  thanks
//
//  Created by Jiha Kim on 4/13/25.
//

import SwiftUI

struct NicknameView: View {
    @EnvironmentObject var nicknameData: NicknameData
    @State private var nickname: String = ""
    @State private var showError: Bool = false
    @State private var isNextActive: Bool = false

    var isNicknameValid: Bool {
        nickname.count >= 2 && nickname.count <= 10
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack(spacing: 0) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            CustomBackButton()
                            
                            // Title
                            Text("닉네임을\n입력해주세요.")
                                .font(.pretendardSemiBold24)
                                .lineSpacing(6)
                                .padding(.top, 48)
                                .padding(.bottom, 54)
                                .padding(.horizontal, 20)
                            
                            // 닉네임 입력
                            VStack(alignment: .leading, spacing: 8) {
                                Text("닉네임")
                                    .font(.pretendardSemiBold16)
                                    .foregroundColor(.gray2)
                                
                                TextField("닉네임을 입력해 주세요.", text: $nickname)
                                    .font(.pretendardMedium14)
                                    .frame(height: 49)
                                    .padding(.horizontal, 20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8).fill(Color.white)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(showError ? Color.redp2 : Color.gray4, lineWidth: 1)
                                    )
                                    .overlay(
                                        Group {
                                            if showError {
                                                Image(systemName: "exclamationmark.circle.fill")
                                                    .foregroundColor(.redp)
                                                    .padding(.trailing, 16)
                                            }
                                        },
                                        alignment: .trailing
                                    )
                                    .onChange(of: nickname) { _, newValue in
                                        showError = !(2...10).contains(newValue.count)
                                    }
                                
                                Group {
                                    if showError {
                                        Text("공백없이 2자 이상 10자 이하로 입력해주세요.")
                                            .font(.pretendardRegular12)
                                            .foregroundColor(.redp)
                                    } else {
                                        // 빈 공간 유지
                                        Text(" ")
                                            .font(.pretendardRegular12)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 400)
                            
                            // 시작하기 버튼
                            
                            VStack {
                                Button(action: {
                                    if isNicknameValid {
                                        nicknameData.nickname = nickname
                                        isNextActive = true
                                    } else {
                                        showError = true
                                    }
                                }) {
                                    Text("시작하기")
                                        .font(.pretendardSemiBold18)
                                        .foregroundColor(isNicknameValid ? .black : .white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 56)
                                        .background(isNicknameValid ? Color.yellowp : Color.gray3)
                                        .cornerRadius(8)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 24)
                                .disabled(!isNicknameValid)
                            }
                            
                            // NavigationLink
                            NavigationLink(value: true) {
                                EmptyView()
                            }
                            .navigationDestination(for: Bool.self) { _ in
                                HomeView()
                            }
                        }
                        .padding(.top, 16)
                    }
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.keyboard)
        }
    }
}


#Preview {
    NicknameView()
        .environmentObject(NicknameData())
}
