//
//  LoginFactory.swift
//  Agenda
//
//  Created by Luis David Goyes on 22/01/24.
//

import SwiftUI

enum LoginFactory {
    static func create() -> some View {
        let viewModel = LoginViewModel()
        let view = LoginView(viewModel: viewModel)
        return view
    }
}
