//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-05.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
