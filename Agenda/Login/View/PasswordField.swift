//
//  PasswordField.swift
//  Agenda
//
//  Created by Luis David Goyes on 9/01/24.
//

import SwiftUI

struct PasswordField: View {
    private struct Constant {
        struct SecureButtonImage {
            static let passwordHidden = "eye.slash"
            static let passwordVisible = "eye"
        }
    }
    
    @State private var secure: Bool = true
    @Binding var text: String
    var title: String
    
    var body: some View {
        HStack {
            Group {
                if secure {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }
            Button(action: {
                secure.toggle()
            }) {
                Image(systemName: self.secure ? Constant.SecureButtonImage.passwordHidden : Constant.SecureButtonImage.passwordVisible)
                    .accentColor(.gray)
            }
        }
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        let text = "some-text"
        let title = "Password"
        PasswordField(text: .constant(text), title: title)
    }
}
