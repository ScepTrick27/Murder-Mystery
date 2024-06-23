//
//  NodeView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//

import SwiftUI

struct NodeView: View {
    var node: NodeModel
    var selectedGroup: Int?
    var onTap: () -> Void

    var body: some View {
        Circle()
            .fill((node.highlighted && (selectedGroup == nil || node.group == selectedGroup)) ? .blue : node.color)
            .frame(width: node.size, height: node.size)
            .onTapGesture {
                onTap()
            }
    }
}

struct NodeModel: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat = 40
    var isLocked: Bool = true
    var highlighted: Bool = false
    var group: Int? = nil  
    var color: Color {
            group != nil ? Color(hex: "#BDBDBD") : Color(hex: "#7C8C98")
        }
}


