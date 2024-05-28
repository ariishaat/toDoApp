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
                .padding(.top, 30)
            DatePicker("Pick a date", selection: $item.timestamp)
                .datePickerStyle(GraphicalDatePickerStyle())
            Button("Save") {
                if viewModel.canSave(item: item) {
                    context.insert(item)
                    do {
                        try context.save()
                        dismiss()
                    } catch {
                        // handle error using an alert
                        print("Failed to save item: \(error.localizedDescription)")
                    }
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Invalid Data"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
            
        }
        .navigationTitle("Create To Do Item")
    }
}
    

//
//#Preview {
//    NewItemView()
//        .modelContainer(for: ToDoItem.self)
//}
