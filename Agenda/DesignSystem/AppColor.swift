//
//  AppColor.swift
//  Agenda
//
//  Created by Luis David Goyes on 26/12/23.
//

import SwiftUI

extension DesignSystem {
    struct AppColor {
        struct State {
            static let cancelled: Color = Color("AmpleOrange")
            static let ongoing: Color = Color("SleekCyan")
            static let pending: Color = Color("GreatMagenta")
            static let completed: Color = AppColor.accent
        }
        struct Field {
            static let background: Color = Color("FieldBackground")
        }
        struct Text {
            static let accent: Color = Color("SystemBlack")
            static let contrast: Color = Color.black
            static let gray: Color = Color("Ash")
        }
        static let accent: Color = Color("ParrotGreen")
        static let tint: Color = Color("Ash")
        static let background: Color = Color("Background")
        static let white: Color = Color("SystemWhite")
        static let black: Color = Color("SystemBlack")
    }
}
