////
////  NewItemsViewVM.swift
////  toDoApp
////
////  Created by Arika I on 2024-05-04.
////
//
import Foundation

class NewItemsViewVM: ObservableObject {
    @Published var showAlert = false
    @Published var alertMessage = ""
    func canSave(item: ToDoItem) -> Bool {
        
        // validate user inputs
        guard !item.title.trimmingCharacters(in: .whitespaces).isEmpty else{
            alertMessage = "Please enter a valid title"
            return false
            //this makes sure user isn't putting empty title
        }
        guard item.timestamp >= Date().addingTimeInterval(-86400) else{
            alertMessage = "Select due date that is today or newer"
            return false
            //this makes sure user isn't putting due date < today date
            // 86400 reps 24hrs, edge case
        }
        return true
    }
}
