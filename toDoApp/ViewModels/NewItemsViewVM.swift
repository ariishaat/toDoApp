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
    init() {}
    
//    func save()
}
