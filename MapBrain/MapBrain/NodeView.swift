//
//  NodeView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//

import SwiftUI

struct NodeView: View {
    var node: NodeModel
    var onSelected: (() -> Void)?
    
    var body: some View {
        Circle()
            .fill(node.highlighted ? Color.blue : Color.gray)
            .frame(width: node.size, height: node.size)
            .onTapGesture {
                onSelected?()
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
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(node: NodeModel(position: CGPoint(x: 0, y: 0), highlighted: true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
