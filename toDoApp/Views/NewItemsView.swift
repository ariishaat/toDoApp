//
//  NewItemsView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemsViewVM()
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form{
                TextField("Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLBtn(title: "Save", background: .pink) {
//                    viewModel.save()
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    NewItemsView()
}
