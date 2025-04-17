//
//  Keyboard.swift
//  thanks
//
//  Created by Jiha Kim on 4/14/25.
//

import Foundation
import UIKit
import SwiftUICore

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
