//
//  NewItemsView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemsViewVM()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLBtn(title: "Save", background: .pink) {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                            // if no errors, save
                        } else {
                            // show alert if errors
                            viewModel.showAlert = true
                        }
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all fields and select due date that is today or newer."))
            }
        }
        
}


struct NewItemView_Previews: PreviewProvider {
    static var previews: some View{
        NewItemsView(newItemPresented: Binding(get:  {return true},
                                               set: { _ in}))
    }

}
