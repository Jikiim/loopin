//
//  WriteView.swift
//  thanks
//
//  Created by Jiha Kim on 4/14/25.
//


import SwiftUI

struct WriteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var showTitleError = false
    @State private var showCompleteView = false
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 EEEE"
        return formatter.string(from: Date())
    }
    
    private var isSaveEnabled: Bool {
        !title.isEmpty && !content.isEmpty && !showTitleError
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        // MARK: - 날짜 표시
                        Text(formattedDate)
                            .font(.pretendardSemiBold24)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 56)
                        
                        
                        TitleWriteView(title: $title, showTitleError: $showTitleError)

                        // 내용 영역
                        ContentWriteView(title: $title, content: $content, showTitleError: $showTitleError)


                    }
                    .padding(.top, 20)
                }
                
                // 저장 버튼
                Button(action: {
                    showCompleteView = true
                }) {
                    Text("저장하기")
                        .font(.pretendardSemiBold18)
                        .foregroundColor(isSaveEnabled ? Color.black : Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(isSaveEnabled ? Color.yellowp : Color.gray3)
                }
                .disabled(!isSaveEnabled) // 비활성화 처리
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.leading, 12)
                    }
                }
            }
            .navigationDestination(isPresented: $showCompleteView) {
                WriteCompleteView(
                    dateString: formattedDate,
                    title: title,
                    content: content,
                    onDismiss: {
                        dismiss() // 또는 홈으로 가는 로직
                    }
                )
            }
        }
    }
}

#Preview {
    WriteView()
}

