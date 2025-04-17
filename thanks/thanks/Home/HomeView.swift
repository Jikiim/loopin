//
//  HomeView.swift
//  thanks
//
//  Created by Jiha Kim on 4/12/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var nicknameData: NicknameData
    
    var body: some View {
        VStack {
            HStack {
                Image("Loopinlogo")
                    .resizable()
                    .frame(width: 105, height: 27)
                
                Spacer()
                
                Image(systemName: "archivebox") // 우측 상단 아이콘
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.yellowp)
            }
            .padding(.bottom, 55)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("\(nicknameData.nickname)")
                    .font(.pretendardExtraBold24)
                +
                Text(" 님,")
                    .font(.pretendardSemiBold24)
                
                Text("오늘의 고마움을 다시 \n꺼내볼 수 있게 기록해봐요.")
                    .font(.pretendardSemiBold24)
                    .lineSpacing(6)
                    .padding(.bottom, 100)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            
            
            Image("mainimg")
                .resizable()
                .scaledToFit()
                .frame(height: 240)
                .padding(.bottom, 120)
            
            
            Button(action: {
                // 버튼 누르면 실행할 액션 (지금은 비워둠)
            }) {
                Text("고마움 기록하기")
                    .font(.pretendardSemiBold18)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .padding(20)
                    .background(Color.yellowp)
                    .cornerRadius(8)
                
            }
        }
        .padding(.horizontal, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let nicknameData = NicknameData()
        nicknameData.nickname = "지하"
        
        return HomeView()
            .environmentObject(nicknameData)
    }
}

