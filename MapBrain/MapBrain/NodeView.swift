//
//  NodeView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//

import SwiftUI

struct NodeView: View {
    @State var node: NodeModel
    var onSelected: (() -> Void)?
    
    var body: some View {
        Circle()
            .fill(node.isLocked ? Color.gray : Color.blue)
            .frame(width: node.size, height: node.size)
            .onTapGesture {
                onSelected?()
            }
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(node: NodeModel(position: CGPoint(x: 0, y: 0)))
    }
}
