//
//  ContentWriteView.swift
//  thanks
//
//  Created by Jiha Kim on 4/16/25.
//

import SwiftUI

struct ContentWriteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var title: String
    @Binding var content: String
    @Binding var showTitleError: Bool
    
    private var isSaveEnabled: Bool {
        !title.isEmpty && !content.isEmpty && !showTitleError
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("내용")
                .font(.pretendardSemiBold16)
                .foregroundColor(.gray2)
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray4, lineWidth: 1)
                    .background(Color.white)
                
                TextEditor(text: $content)
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .font(.pretendardMedium14)
                    .background(Color.clear)
                    .onChange(of: content) {
                        if content.count > 200 {
                            content = String(content.prefix(200))
                        }
                    }
                
                if content.isEmpty {
                    Text("내용을 입력해 주세요.")
                        .foregroundColor(Color(.placeholderText))
                        .padding(20)
                        .font(.pretendardMedium14)
                }
                
            }
            .frame(height: 180)
            
            
            HStack {
                Spacer()
                Text("\(content.count)")
                    .font(.pretendardSemiBold12)
                    .foregroundColor(.yellowp)
                Text("/ 200")
                    .font(.pretendardRegular12)
                    .foregroundStyle(.gray3)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

//#Preview {
//    ContentWriteView()
//}
