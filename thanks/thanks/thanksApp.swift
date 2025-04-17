//
//  thanksApp.swift
//  thanks
//
//  Created by Jiha Kim on 4/12/25.
//

import SwiftUI

@main
struct thanksApp: App {
    @StateObject private var nicknameData = NicknameData()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WriteView()
            }
            .environmentObject(nicknameData)
        }
    }
}
