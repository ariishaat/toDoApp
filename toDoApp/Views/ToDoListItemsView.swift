//
//  ToDoListItemsView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI

struct ToDoListItemsView: View {
//    @StateObject var viewModel = ToDoListItemsView()
//    init(){
//
//    }
//    
    var body: some View {
        NavigationView{
            VStack {

            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action - add new item to list
                } label: {
                    Image(systemName: "plus")
                }
            }
        }

    }
}

struct ToDOListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView()
    }
}
