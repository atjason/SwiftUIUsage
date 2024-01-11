//
//  ContentView.swift
//  ListUsage
//
//  Created by Jason Zheng on 2024/1/11.
//

import SwiftUI

struct ContentView: View {
  @State private var users = ["Tom", "Jim", "Emily"]
  
  var body: some View {
    NavigationStack {
      List($users, id: \.self, editActions: .all) { $user in
        Text(user)
      }
      .navigationTitle("Users")
      .toolbar() {
        EditButton()
      }
            
      List {
        ForEach($users, id: \.self) { $user in
          Text(user)
        }
        .onMove(perform: move)
        .onDelete(perform: delete)
      }
    }
  }
  
  func move(from source: IndexSet, to destination: Int) {
    withAnimation {
      users.move(fromOffsets: source, toOffset: destination)
    }
  }
  
  func delete(at offsets: IndexSet) {
    withAnimation {
      users.remove(atOffsets: offsets)
    }
  }
}

#Preview {
  ContentView()
}
