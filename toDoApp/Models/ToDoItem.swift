//
//  ToDoItem.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import Foundation
import SwiftData

// define a single to do list it∏em using SwiftData

@Model
final class ToDoItem {
    var title: String
    var timestamp: Date
    var isDone: Bool
    
    init(title: String = "",
         timestamp: Date = .now,
         isDone: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isDone = isDone
    }
}
