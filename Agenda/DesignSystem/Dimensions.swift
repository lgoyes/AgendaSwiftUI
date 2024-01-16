//
//  Dimensions.swift
//  Agenda
//
//  Created by Luis David Goyes on 15/01/24.
//

import Foundation

extension DesignSystem {
    struct DefaultDimension {
        private static let defaultFormCornerRadius = 15.0
        struct Field {
            static let cornerRadius = defaultFormCornerRadius
        }
        struct Button {
            static let cornerRadius = defaultFormCornerRadius
        }
    }
}
