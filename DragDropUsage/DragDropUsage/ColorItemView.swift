//
//  ColorItemView.swift
//  DragDropUsage
//
//  Created by Jason Zheng on 2024/1/11.
//

import SwiftUI

struct ColorItemView: View {
  let backgroundColor: Color
  
  var body: some View {
    VStack {
      Spacer()
      Text(backgroundColor.description.capitalized)
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 40)
    .background(backgroundColor)
    .cornerRadius(20)
  }
}

#Preview {
  ColorItemView(backgroundColor: .blue)
}
