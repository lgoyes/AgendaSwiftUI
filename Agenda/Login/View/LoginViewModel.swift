//
//  LoginViewModel.swift
//  Agenda
//
//  Created by Luis David Goyes on 22/01/24.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelType: ObservableObject {
    var email: String { set get }
    var password: String { set get }
    func processSignInPressed()
    func processForgotPassword()
}

class LoginViewModel: LoginViewModelType {
    private struct Constant {
        struct Email {
            static let initialValue = ""
        }
        struct Password {
            static let initialValue = ""
        }
    }
    
    var email: String = Constant.Email.initialValue
    var password: String = Constant.Password.initialValue
    
    func processSignInPressed() {
        print("Login con credenciales: \(email) y \(password)")
        login()
        // test@test.com
    }
    
    func processForgotPassword() {
        print("Forgot password con correo \(email)")
    }
    
    func login() {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("success")
                }
            }
        }
}
