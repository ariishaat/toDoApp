//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-05.
//

import SwiftUI
import SwiftData

@main
struct ToDo: App {
    var body: some Scene{
        WindowGroup{
            ContentView()
                .modelContainer(for: ToDoItem.self)
            // app is now listening for items to store in database
        }
    }
    
}
