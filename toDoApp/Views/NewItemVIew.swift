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
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = ToDoItem()
    
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Button("Save") {
                    withAnimation {
                        context.insert(item)
                        viewModel.save()
                    }
                }
                
            }
        }
    }
}
        
//        List {
//            TextField("Name", text: .constant(""))
//            DatePicker("Pick a Date", selection: .constant(.now))
//            Button("Save") {
//                withAnimation {
//                    context.insert(item)
//                }
//                dismiss()
//            }
//        }
//        .navigationTitle("Create New Item")
//    }


#Preview {
    NewItemView()
        .modelContainer(for: ToDoItem.self)
}
