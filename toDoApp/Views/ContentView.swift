//
//  ContentView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var showCreate = false
    @Query private var items: [ToDoItem]
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach(items) { item in
                        HStack{
                        Text(item.title)
                            .font(.title)
                            .bold()
                        
                        Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                            .font(.callout)
                        Button {
                            withAnimation{
                                item.isDone.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isDone ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
                    
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add Item", systemImage: "plus")
                    })
                    .sheet(isPresented: $showCreate, content: { NavigationStack {
                        NewItemView()
                    }
                    .presentationDetents([.medium])
                    })
                }
            }
        }
    }
}
    
#Preview {
        ContentView()
    }
