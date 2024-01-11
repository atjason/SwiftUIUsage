//
//  ContentView.swift
//  DragDropUsage
//
//  Created by Jason Zheng on 2024/1/11.
//

import SwiftUI

struct ContentView: View {
  @State private var draggedColor: Color?
  @State private var colors: [Color] = [.purple, .blue, .cyan, .green, .yellow, .orange, .red]
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      ForEach(colors, id: \.self) { color in
        ColorItemView(backgroundColor: color)
          .padding(.vertical, 5)
          .onDrag({
            draggedColor = color
            return NSItemProvider()
          })
          .onDrop(of: [.text], delegate: DropViewDelegate(destinationItem: color, colors: $colors, draggedItem: $draggedColor))
      }
    }
    .padding()
    .ignoresSafeArea()
    .background(.brown)
  }
}

struct DropViewDelegate: DropDelegate {
  
  let destinationItem: Color
  @Binding var colors: [Color]
  @Binding var draggedItem: Color?
  
  func dropUpdated(info: DropInfo) -> DropProposal? {
    return DropProposal(operation: .move)
  }
  
  func performDrop(info: DropInfo) -> Bool {
    draggedItem = nil
    return true
  }
  
  func dropEntered(info: DropInfo) {
    if let draggedItem,
       let fromIndex = colors.firstIndex(of: draggedItem),
       let toIndex = colors.firstIndex(of: destinationItem),
       fromIndex != toIndex {
      withAnimation {
        colors.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
      }
    }
  }
}

#Preview {
  ContentView()
}
