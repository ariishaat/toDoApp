//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-05.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewVM()

    var body: some View {
        NavigationView{
            VStack{

            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action - add new item to list
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemsView()
            }
        }
    }
}

#Preview {
    ToDoListView()
}
