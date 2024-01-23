//
//  AuthencationField.swift
//  Agenda
//
//  Created by Luis David Goyes on 22/01/24.
//

import SwiftUI

enum AuthencationFieldType {
    case password, email
}

struct AuthencationField: View {
    private struct Constant {
        struct Field {
            struct Icon {
                static let width = 30.0
            }
        }
    }
    var image: String
    var title: String
    var prompt: String
    var type: AuthencationFieldType = .email
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle( DesignSystem.AppColor.Text.accent )
            
            HStack {
                Image(systemName: image)
                    .frame(width: Constant.Field.Icon.width)
                Group {
                    switch type {
                    case .email:
                        TextField(prompt, text: $text)
                            .keyboardType(.emailAddress)
                    case .password:
                        PasswordField(text: $text, title: prompt)
                    }
                }
            }
            .padding()
            .background(DesignSystem.AppColor.Field.background)
            .clipShape(RoundedRectangle(cornerRadius: DesignSystem.DefaultDimension.Field.cornerRadius))
        }
    }
}

struct AuthencationField_Previews: PreviewProvider {
    static var previews: some View {
        AuthencationField(image: "lock", title: "Some title", prompt: "Some prompt", text: .constant("lo que sea"))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
