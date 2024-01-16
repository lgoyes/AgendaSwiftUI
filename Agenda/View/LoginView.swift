//
//  LoginView.swift
//  Agenda
//
//  Created by Luis David Goyes on 26/12/23.
//

import SwiftUI

protocol LoginViewDelegate: AnyObject {
    func performLogin()
    func processForgotPassword()
}

struct LoginView: View {
    private struct Constant {
        struct Body {
            static let horizontalPadding = 20.0
        }
        struct LoginHeader {
            static let paddingBottom = 10.0
        }
        struct Email {
            static let title = "E-mail"
            static let image = "mail"
            static let prompt = "Enter your email"
            static let initialValue = ""
        }
        struct Password {
            static let title = "Password"
            static let image = "lock"
            static let prompt = "Your password"
            static let initialValue = ""
        }
        struct ForgotPassword {
            static let title = "Forgot password?"
        }
        struct SignIn {
            static let title = "Sign In"
        }
    }
    
    @State var email: String = Constant.Email.initialValue
    @State var password: String = Constant.Password.initialValue
    weak var delegate: LoginViewDelegate?
    
    var body: some View {
        ZStack {
            DesignSystem.AppColor.background.edgesIgnoringSafeArea(.all)
            VStack {
                LoginHeader()
                    .padding(.bottom, Constant.LoginHeader.paddingBottom)
                
                AuthencationField(image: Constant.Email.image, title: Constant.Email.title, prompt: Constant.Email.title, type: .email, text: $email)
                
                AuthencationField(image: Constant.Password.image, title: Constant.Password.title, prompt: Constant.Password.title, type: .password, text: $password)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text(Constant.ForgotPassword.title)
                            .font(.caption)
                    }
                }
                
                
                
                Button {
                    delegate?.performLogin()
                } label: {
                    Text(Constant.SignIn.title)
                        .foregroundColor(DesignSystem.AppColor.Text.contrast)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(DesignSystem.AppColor.accent)
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem .DefaultDimension.Button.cornerRadius))
            }
            .padding(.horizontal, Constant.Body.horizontalPadding)
        }
        .foregroundStyle(DesignSystem.AppColor.Text.gray)
    }
}

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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

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
