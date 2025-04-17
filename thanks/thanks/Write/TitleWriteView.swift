//
//  TitleWriteView.swift
//  thanks
//
//  Created by Jiha Kim on 4/16/25.
//

import SwiftUI

struct TitleWriteView: View {
    
    @Binding var title: String
    @Binding var showTitleError: Bool
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("제목")
                .font(.pretendardSemiBold16)
                .foregroundColor(.gray2)
            
            ZStack(alignment: .topTrailing) {
                
                TextField("제목을 입력해 주세요.", text: $title)
                    .font(.pretendardMedium14)
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(showTitleError ? Color.redp2 : Color.gray4, lineWidth: 1)
                    )
                    .onChange(of: title) {
                        showTitleError = !(1...10).contains(title.count)
                    }
                
                if showTitleError && !title.isEmpty {
                    Button(action: {
                        title = ""
                        showTitleError = false
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray3)
                            .padding(.trailing, 12)
                            .padding(.top, 16)
                    }
                }
            }
            
            HStack {
                if showTitleError {
                    HStack {
                        Image(systemName: "exclamationmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.redp)
                        
                        Text("제목을 입력해주세요.")
                            .font(.pretendardRegular12)
                            .foregroundColor(.redp)
                    }
                }
                Spacer()
                
                Text("\(title.count)")
                    .font(.pretendardSemiBold12)
                    .foregroundColor(.yellowp)
                
                Text("/ 10")
                    .font(.pretendardRegular12)
                    .foregroundStyle(.gray3)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
    }
}

//#Preview {
//    TitleWriteView()
//}
