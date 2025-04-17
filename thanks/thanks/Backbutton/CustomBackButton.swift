//
// CustomBackButton.swift
//  thanks
//
//  Created by Jiha Kim on 4/13/25.
//

import SwiftUI

struct CustomBackButton: View {
        @Environment(\.dismiss) var dismiss

        var body: some View {
            ZStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .medium))
                        }
                        .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
    }


#Preview {
    CustomBackButton()
}
