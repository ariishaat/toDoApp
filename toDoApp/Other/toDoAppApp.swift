//
//  toDoAppApp.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import FirebaseCore
import SwiftUI

@main
struct toDoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
