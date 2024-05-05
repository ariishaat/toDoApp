//
//  NewItemsViewVM.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import Foundation

class NewItemsViewVM: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init() {}
    
    func save(){
        
    }
    
    var canSave: Bool {
        // validate user inputs
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
            //this makes sure user isn't putting empty title
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
            //this makes sure user isn't putting due date < today date
            // 86400 reps 24hrs, edge case
        }
        return true
    }
}
