//
//  LoginView.swift
//  Agenda
//
//  Created by Luis David Goyes on 26/12/23.
//

import SwiftUI

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
        }
        struct Password {
            static let title = "Password"
            static let image = "lock"
            static let prompt = "Your password"
        }
        struct ForgotPassword {
            static let title = "Forgot password?"
        }
        struct SignIn {
            static let title = "Sign In"
        }
    }
    
    @State var viewModel: any LoginViewModelType
    
    var body: some View {
        ZStack {
            DesignSystem.AppColor.background.edgesIgnoringSafeArea(.all)
            VStack {
                LoginHeader()
                    .padding(.bottom, Constant.LoginHeader.paddingBottom)
                
                AuthencationField(image: Constant.Email.image, title: Constant.Email.title, prompt: Constant.Email.title, type: .email, text: $viewModel.email)
                
                AuthencationField(image: Constant.Password.image, title: Constant.Password.title, prompt: Constant.Password.title, type: .password, text: $viewModel.password)
                
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.processForgotPassword()
                    } label: {
                        Text(Constant.ForgotPassword.title)
                            .font(.caption)
                    }
                }
                
                
                
                Button {
                    viewModel.processSignInPressed()
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

struct LoginView_Previews: PreviewProvider {
    class PreviewLoginViewModel: LoginViewModelType {
        func processSignInPressed() {
            print("preview signin")
        }
        
        func processForgotPassword() {
            print("preview forgotpassword")
        }
        
        var email: String = ""
        var password: String = ""
    }
    static var previews: some View {
        let viewModel = PreviewLoginViewModel()
        LoginView(viewModel: viewModel)
            .preferredColorScheme(.dark)
    }
}
