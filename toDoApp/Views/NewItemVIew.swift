//
//  NewItemsView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI
import SwiftData


struct NewItemView: View {
   @StateObject var viewModel = NewItemsViewVM()
    @State private var item = ToDoItem()
    @Environment(\.modelContext) var context

    
//    @Binding var newItemPresented: Bool
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        List {
            TextField("Name", text: $item.title)
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            DatePicker("Pick a date", selection: $item.timestamp)
            Button("Save") {
                if viewModel.canSave {
                    viewModel.save()
                    context.insert(item)
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding()
            
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Please fill in all field and select due date that is today or newer"))
        }
    }
}
    

//
//#Preview {
//    NewItemView()
//        .modelContainer(for: ToDoItem.self)
//}
