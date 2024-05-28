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
    @State private var toDoEdit: ToDoItem? //optional, sheet modifier
    @Query private var items: [ToDoItem]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items) { item in
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.title2)
                                    .bold()
                                
                                Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                    .font(.footnote)
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                            Spacer()
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
                            .padding(.trailing, 8)
                            .buttonStyle(.plain)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    context.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                        }
                    }
                    
                    .listStyle(PlainListStyle())
                }
                Spacer()
                    .navigationBarTitle("To Do List").font(.largeTitle)
                Spacer()
                    .toolbar {
                        ToolbarItem {
                            Button(action: {
                                showCreate.toggle()
                            }, label: {
                                Label("Add Item", systemImage: "plus")
                            })
                            .sheet(isPresented: $showCreate, content: { NavigationStack {
                                NewItemView()}})
                        }
                    }
            }
        }
    }
}



    
#Preview {
        ContentView()
    }
