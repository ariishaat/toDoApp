//
//  ContentView.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ToDoListItemsView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
