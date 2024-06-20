//
//  BrainView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 19/06/2024.
//



import SwiftUI

struct SelectedNode: Identifiable {
    var id: Int
}

struct BrainView: View {
    @State private var nodes: [NodeModel] = [
        // Central nodes
        NodeModel(position: CGPoint(x: 550, y: 520), size: 120), // Center Left
        NodeModel(position: CGPoint(x: 650, y: 650), size: 120), // Center Bottom
        NodeModel(position: CGPoint(x: 770, y: 530), size: 120), // Center Right
        NodeModel(position: CGPoint(x: 650, y: 400), size: 120), // Center Top
        
        NodeModel(position: CGPoint(x: 540, y: 270), size: 80),
        NodeModel(position: CGPoint(x: 430, y: 350), size: 80),
        NodeModel(position: CGPoint(x: 400, y: 500), size: 80),
        NodeModel(position: CGPoint(x: 390, y: 680), size: 80),
        NodeModel(position: CGPoint(x: 540, y: 780), size: 80),
        
        NodeModel(position: CGPoint(x: 780, y: 750), size: 80),
        NodeModel(position: CGPoint(x: 900, y: 640), size: 80),
        NodeModel(position: CGPoint(x: 930, y: 500), size: 80),
        NodeModel(position: CGPoint(x: 860, y: 360), size: 80),
        NodeModel(position: CGPoint(x: 760, y: 240), size: 80),
        
        // Define the positions of nodes based on the brain structure
        NodeModel(position: CGPoint(x: 440, y: 160)),
        NodeModel(position: CGPoint(x: 390, y: 80)),
        NodeModel(position: CGPoint(x: 280, y: 100)),
        NodeModel(position: CGPoint(x: 220, y: 190)),
        NodeModel(position: CGPoint(x: 340, y: 160)),
        NodeModel(position: CGPoint(x: 300, y: 270)),
        NodeModel(position: CGPoint(x: 220, y: 320)),
        NodeModel(position: CGPoint(x: 180, y: 260)),
        NodeModel(position: CGPoint(x: 140, y: 380)),
        NodeModel(position: CGPoint(x: 200, y: 460)),
        NodeModel(position: CGPoint(x: 120, y: 500)),
        NodeModel(position: CGPoint(x: 200, y: 570)),
        NodeModel(position: CGPoint(x: 160, y: 650)),
        NodeModel(position: CGPoint(x: 240, y: 720)),
        NodeModel(position: CGPoint(x: 180, y: 780)),
        NodeModel(position: CGPoint(x: 280, y: 840)),
        NodeModel(position: CGPoint(x: 380, y: 860)),
        
        
        NodeModel(position: CGPoint(x: 840, y: 160)),
        NodeModel(position: CGPoint(x: 870, y: 50)),
        NodeModel(position: CGPoint(x: 680, y: 100)),
        NodeModel(position: CGPoint(x: 920, y: 190)),
        NodeModel(position: CGPoint(x: 1010, y: 160)),
        NodeModel(position: CGPoint(x: 980, y: 270)),
        NodeModel(position: CGPoint(x: 1050, y: 320)),
        NodeModel(position: CGPoint(x: 1100, y: 260)),
        NodeModel(position: CGPoint(x: 1160, y: 380)),
        NodeModel(position: CGPoint(x: 1180, y: 460)),
        NodeModel(position: CGPoint(x: 1100, y: 500)),
        NodeModel(position: CGPoint(x: 1170, y: 570)),
        NodeModel(position: CGPoint(x: 1090, y: 650)),
        NodeModel(position: CGPoint(x: 1120, y: 720)),
        NodeModel(position: CGPoint(x: 990, y: 780)),
        NodeModel(position: CGPoint(x: 1060, y: 840)),
        NodeModel(position: CGPoint(x: 900, y: 860)),
        NodeModel(position: CGPoint(x: 760, y: 900)),
        
    ]
    
    @State private var connections: [Connection] = [
        // Center Big Circles
        Connection(startIndex: 0, endIndex: 1),
        Connection(startIndex: 0, endIndex: 2),
        Connection(startIndex: 1, endIndex: 2),
        Connection(startIndex: 2, endIndex: 3),
        Connection(startIndex: 3, endIndex: 0),
        
        // Middle Circles
        Connection(startIndex: 3, endIndex: 4),
        Connection(startIndex: 4, endIndex: 5),
        Connection(startIndex: 5, endIndex: 6),
        Connection(startIndex: 6, endIndex: 7),
        Connection(startIndex: 7, endIndex: 8),
        
        Connection(startIndex: 9, endIndex: 10),
        Connection(startIndex: 10, endIndex: 11),
        Connection(startIndex: 11, endIndex: 12),
        Connection(startIndex: 12, endIndex: 13),
        
        Connection(startIndex: 5, endIndex: 0),
        Connection(startIndex: 5, endIndex: 3),
        Connection(startIndex: 6, endIndex: 0),
        Connection(startIndex: 7, endIndex: 0),
        Connection(startIndex: 8, endIndex: 1),
        Connection(startIndex: 8, endIndex: 0),
        Connection(startIndex: 9, endIndex: 1),
        Connection(startIndex: 9, endIndex: 2),
        Connection(startIndex: 10, endIndex: 2),
        Connection(startIndex: 11, endIndex: 2),
        Connection(startIndex: 12, endIndex: 3),
        Connection(startIndex: 13, endIndex: 3),
        Connection(startIndex: 2, endIndex: 12),

        
        
        Connection(startIndex: 4, endIndex: 14),
        Connection(startIndex: 14, endIndex: 15),
        Connection(startIndex: 15, endIndex: 16),
        Connection(startIndex: 16, endIndex: 17),
        Connection(startIndex: 17, endIndex: 18),
        Connection(startIndex: 18, endIndex: 14),
        Connection(startIndex: 18, endIndex: 19),
        Connection(startIndex: 19, endIndex: 20),
        Connection(startIndex: 20, endIndex: 21),
        Connection(startIndex: 17, endIndex: 21),
        Connection(startIndex: 20, endIndex: 22),
        Connection(startIndex: 21, endIndex: 22),
        Connection(startIndex: 22, endIndex: 23),
        Connection(startIndex: 23, endIndex: 24),
        Connection(startIndex: 24, endIndex: 25),
        Connection(startIndex: 25, endIndex: 26),
        Connection(startIndex: 26, endIndex: 27),
        Connection(startIndex: 27, endIndex: 28),
        Connection(startIndex: 28, endIndex: 29),
        Connection(startIndex: 29, endIndex: 30),
        Connection(startIndex: 22, endIndex: 24),
        Connection(startIndex: 20, endIndex: 23),
        Connection(startIndex: 23, endIndex: 25),
        Connection(startIndex: 25, endIndex: 27),
        
        
        Connection(startIndex: 30, endIndex: 7),
        Connection(startIndex: 30, endIndex: 8),
        Connection(startIndex: 29, endIndex: 7),
        Connection(startIndex: 27, endIndex: 7),
        Connection(startIndex: 25, endIndex: 6),
        Connection(startIndex: 25, endIndex: 7),
        Connection(startIndex: 23, endIndex: 6),
        Connection(startIndex: 19, endIndex: 5),
        Connection(startIndex: 20, endIndex: 6),
        Connection(startIndex: 18, endIndex: 5),
        Connection(startIndex: 14, endIndex: 5),
        
        Connection(startIndex: 13, endIndex: 31),
        Connection(startIndex: 13, endIndex: 33),
        Connection(startIndex: 12, endIndex: 31),
        Connection(startIndex: 12, endIndex: 34),
        Connection(startIndex: 12, endIndex: 36),
        Connection(startIndex: 11, endIndex: 37),
        Connection(startIndex: 11, endIndex: 36),
        Connection(startIndex: 11, endIndex: 41),
        Connection(startIndex: 11, endIndex: 39),
        Connection(startIndex: 10, endIndex: 41),
        Connection(startIndex: 10, endIndex: 43),
        Connection(startIndex: 10, endIndex: 45),
        Connection(startIndex: 9, endIndex: 47),
        Connection(startIndex: 47, endIndex: 10),

        
        Connection(startIndex: 31, endIndex: 32),
        Connection(startIndex: 32, endIndex: 33),
        Connection(startIndex: 33, endIndex: 34),
        Connection(startIndex: 34, endIndex: 35),
        Connection(startIndex: 35, endIndex: 36),
        Connection(startIndex: 36, endIndex: 37),
        Connection(startIndex: 37, endIndex: 38),
        Connection(startIndex: 38, endIndex: 39),
        Connection(startIndex: 39, endIndex: 40),
        Connection(startIndex: 40, endIndex: 41),
        Connection(startIndex: 41, endIndex: 42),
        Connection(startIndex: 42, endIndex: 43),
        Connection(startIndex: 43, endIndex: 44),
        Connection(startIndex: 44, endIndex: 45),
        Connection(startIndex: 45, endIndex: 46),
        Connection(startIndex: 46, endIndex: 47),
        Connection(startIndex: 45, endIndex: 47),
        Connection(startIndex: 43, endIndex: 45),
        Connection(startIndex: 43, endIndex: 41),
        Connection(startIndex: 37, endIndex: 39),
        Connection(startIndex: 39, endIndex: 41),
        Connection(startIndex: 32, endIndex: 35),
        Connection(startIndex: 35, endIndex: 38),
        Connection(startIndex: 42, endIndex: 44),
        Connection(startIndex: 42, endIndex: 40),
        Connection(startIndex: 44, endIndex: 46),
        Connection(startIndex: 47, endIndex: 48),
        Connection(startIndex: 9, endIndex: 48),




    ]
    
    @State private var selectedNode: SelectedNode? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Draw connections
                ForEach(connections) { connection in
                    if connection.startIndex < nodes.count && connection.endIndex < nodes.count {
                        Path { path in
                            let start = nodes[connection.startIndex].position
                            let end = nodes[connection.endIndex].position
                            path.move(to: start)
                            path.addLine(to: end)
                        }
                        .stroke(Color.lightGray, lineWidth: 2)
                    }
                }
                
                // Draw nodes
                ForEach(nodes.indices, id: \.self) { index in
                    NodeView(node: nodes[index]) {
                        selectedNode = SelectedNode(id: index)
                    }
                    .position(nodes[index].position)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .sheet(item: $selectedNode) { selected in
            PuzzleView {
                nodes[selected.id].isLocked = false
                selectedNode = nil
            }
        }
    }
}

struct NodeModel: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat = 40
    var isLocked: Bool = true
}

struct Connection: Identifiable, Hashable {
    let id = UUID()
    let startIndex: Int
    let endIndex: Int
}

extension Color {
    static let lightGray = Color(white: 0.8)
}

struct BrainView_Previews: PreviewProvider {
    static var previews: some View {
        BrainView()
    }
}
