//
//  ContentView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = ToDoListViewVM()
    @State private var showCreate = false
    @Query private var items: [ToDoItem]
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items){ item in
                    HStack {
                        Text(item.itemttl)
                            .font(.largeTitle)
                            .bold()
                        
                        Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                            .font(.callout)
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isDone ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            

            
            .navigationTitle("To Do List")

            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }

        }
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(newItemPresented: $viewModel.showingNewItemView)
        }
    }
}


//#Preview {
//    ContentView()
//}
