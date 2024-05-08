//
//  NewItemsView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI
import SwiftData


struct NewItemView: View {
    //    @StateObject var viewModel = NewItemsViewVM()
    @State private var item = ToDoItem()
    @Environment(\.modelContext) var context

    
//    @Binding var newItemPresented: Bool
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Pick a date", selection: $item.timestamp)
            Button("Save") {
                withAnimation {
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("New Item")
    }
}
    

//        VStack{
//            Text("New Item")
//                .font(.system(size: 32))
//                .bold()
//                .padding(.top, 100)
//            Form{
//                TextField("Title", text: $viewModel.title)
//                    .textFieldStyle(DefaultTextFieldStyle())
//                DatePicker("Due Date", selection: $viewModel.dueDate)
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                
//                TLButton(title: "Save",
//                         background: .pink) {
//                    if viewModel.canSave {
//                        viewModel.save()
//                        newItemPresented = false
//                    } else {
//                        viewModel.showAlert = true
//                    }
//                }
//                         .padding()
//                
//            }
//            .alert(isPresented: $viewModel.showAlert) {
//                Alert(title: Text("Error"), message: Text("Please fill in all field and select due date that is today or newer"))
//            }
//        }
//    }

//#Preview {
//    NewItemView()
//        .modelContainer(for: ToDoItem.self)
//}


//struct NewItemVIew_Preview: PreviewProvider {
//    static var previews: some View {
//        NewItemView(newItemPresented: Binding(get: { return true },
//                                              set: { _ in }))
//    }
//}
