//
//  LoginHeader.swift
//  Agenda
//
//  Created by Luis David Goyes on 22/01/24.
//

import SwiftUI

struct LoginHeader: View {
    private struct Constant {
        static let title = "Hello! 👋"
        static let subtitle = "Enter your details bellow"
    }
    var body: some View {
        VStack {
            Text(Constant.title)
                .foregroundColor(DesignSystem.AppColor.black)
                .font(.title)
            Text(Constant.subtitle)
                .foregroundColor(DesignSystem.AppColor.tint)
                .font(.caption)
        }
    }
}

struct LoginHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeader()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
