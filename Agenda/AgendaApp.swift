//
//  AgendaApp.swift
//  Agenda
//
//  Created by Luis David Goyes on 26/12/23.
//

import SwiftUI
import Firebase

@main
struct AgendaApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginFactory.create()
        }
    }
}
