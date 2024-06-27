import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var rows: Int = 5
    var columns: Int = 5
    var cellSize: CGFloat = 40.0  // Adjust this to make hexagons smaller
    let gridPadding: CGFloat = 20.0
    let hexSpacing: CGFloat = 2.0  // Adjust this to change spacing between hexagons
    var dots: [[SKShapeNode?]] = []
    var currentLine: SKShapeNode?
    var path: CGMutablePath?
    var startDot: SKShapeNode?
    var startColor: UIColor?
    var currentColumn: Int?
    var currentRow: Int?
    var lines: [SKShapeNode] = []
    var visitedPoints: [(column: Int, row: Int, point: CGPoint)] = []
    var hexagonOutlines: [SKShapeNode] = []
    
    var puzzlePicker: SKNode!
    var selectedPuzzleIndex: Int = 0 {
        didSet {
            clearBoard()
            loadPuzzle(puzzles[selectedPuzzleIndex])
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        setupPicker()
        loadPuzzle(puzzles[selectedPuzzleIndex])
    }
    
    func setupPicker() {
        puzzlePicker = SKNode()
        puzzlePicker.position = CGPoint(x: size.width / 2, y: size.height - 50)
        addChild(puzzlePicker)
        
        let label = SKLabelNode(text: "Select Puzzle:")
        label.fontSize = 24
        label.fontColor = .white
        label.position = CGPoint(x: 0, y: 20)
        puzzlePicker.addChild(label)
        
        for (index, puzzle) in puzzles.enumerated() {
            let puzzleLabel = SKLabelNode(text: "Puzzle \(index + 1)")
            puzzleLabel.fontSize = 18
            puzzleLabel.fontColor = .yellow
            puzzleLabel.name = "puzzle_\(index)"
            puzzleLabel.position = CGPoint(x: CGFloat(index - puzzles.count / 2) * 100, y: -20)
            puzzlePicker.addChild(puzzleLabel)
        }
    }
    
    func setupBoard() {
        dots = Array(repeating: Array(repeating: nil, count: columns), count: rows)
        
        let hexagonWidth = cellSize * sqrt(3.0)
        let hexagonHeight = cellSize * 2
        
        let screenWidth = size.width
        let screenHeight = size.height
        let gridWidth = (hexagonWidth + hexSpacing) * CGFloat(columns) - hexSpacing
        let gridHeight = (hexagonHeight * 0.75 * CGFloat(rows)) + (hexSpacing * CGFloat(rows - 1))
        
        let offsetX = (screenWidth - gridWidth) / 2
        let offsetY = (screenHeight - gridHeight) / 2
        
        for row in 0..<rows {
            for col in 0..<columns {
                let xOffset = (row % 2 == 0) ? 0 : (hexagonWidth / 2)
                let position = CGPoint(x: CGFloat(col) * (hexagonWidth + hexSpacing) + xOffset + offsetX,
                                       y: CGFloat(row) * (hexagonHeight * 0.75 + hexSpacing) + offsetY)
                
                let path = CGMutablePath()
                for i in 0..<6 {
                    let angle = CGFloat(i) * CGFloat.pi / 3.0 + CGFloat.pi / 6.0  // Rotate by 30 degrees
                    let x = cellSize * cos(angle)
                    let y = cellSize * sin(angle)
                    if i == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                path.closeSubpath()
                
                let outline = SKShapeNode(path: path)
                outline.strokeColor = .yellow
                outline.lineWidth = 2
                outline.position = position
                addChild(outline)
                
                hexagonOutlines.append(outline)
                dots[row][col] = nil
            }
        }
    }
    
    func clearBoard() {
        // Remove all dots
        for row in dots {
            for dot in row {
                dot?.removeFromParent()
            }
        }
        dots.removeAll()
        
        // Remove all lines
        for line in lines {
            line.removeFromParent()
        }
        lines.removeAll()
        
        // Remove all hexagon outlines
        for outline in hexagonOutlines {
            outline.removeFromParent()
        }
        hexagonOutlines.removeAll()
    }
    
    func loadPuzzle(_ puzzle: Puzzle) {
        // Update rows and columns based on the puzzle
        rows = puzzle.rows
        columns = puzzle.columns
        
        // Reinitialize the dots array
        dots = Array(repeating: Array(repeating: nil, count: columns), count: rows)
        
        setupBoard()
        
        for (row, col, color) in puzzle.dots {
            let position = pointForColumn(col, row: row)
            let dot = SKShapeNode(circleOfRadius: cellSize / 3)  // Make the dot smaller
            dot.position = position
            dot.strokeColor = .clear
            dot.fillColor = color
            addChild(dot)
            dots[row][col] = dot
        }
    }
    
    func pointForColumn(_ column: Int, row: Int) -> CGPoint {
        let hexagonWidth = cellSize * sqrt(3.0)
        let hexagonHeight = cellSize * 2
        let screenWidth = size.width
        let screenHeight = size.height
        let gridWidth = (hexagonWidth + hexSpacing) * CGFloat(columns) - hexSpacing
        let gridHeight = (hexagonHeight * 0.75 * CGFloat(rows)) + (hexSpacing * CGFloat(rows - 1))
        
        let offsetX = (screenWidth - gridWidth) / 2
        let offsetY = (screenHeight - gridHeight) / 2
        
        let xOffset = (row % 2 == 0) ? 0 : (hexagonWidth / 2)
        return CGPoint(x: CGFloat(column) * (hexagonWidth + hexSpacing) + xOffset + offsetX,
                       y: CGFloat(row) * (hexagonHeight * 0.75 + hexSpacing) + offsetY)
    }
    
    func columnAndRowForPoint(_ point: CGPoint) -> (column: Int, row: Int)? {
        let hexagonWidth = cellSize * sqrt(3.0)
        let hexagonHeight = cellSize * 2
        let screenWidth = size.width
        let screenHeight = size.height
        let gridWidth = (hexagonWidth + hexSpacing) * CGFloat(columns) - hexSpacing
        let gridHeight = (hexagonHeight * 0.75 * CGFloat(rows)) + (hexSpacing * CGFloat(rows - 1))
        
        let offsetX = (screenWidth - gridWidth) / 2
        let offsetY = (screenHeight - gridHeight) / 2
        
        let column = Int((point.x - offsetX) / (hexagonWidth + hexSpacing))
        let row = Int((point.y - offsetY) / (hexagonHeight * 0.75 + hexSpacing))
        
        if column >= 0 && column < columns && row >= 0 && row < rows {
            return (column, row)
        } else {
            return nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if let (column, row) = columnAndRowForPoint(location),
           let dot = dots[row][column] {
            
            // Check if there's an existing line starting from this dot
            if let existingLine = lines.first(where: { line in
                let path = line.path!
                var containsPoint = false
                path.applyWithBlock { element in
                    if element.pointee.type == .moveToPoint || element.pointee.type == .addLineToPoint {
                        let point = element.pointee.points.pointee
                        if point == dot.position {
                            containsPoint = true
                        }
                    }
                }
                return containsPoint
            }) {
                existingLine.removeFromParent()
                lines.removeAll { $0 == existingLine }
            }
            
            startDot = dot
            startColor = dot.fillColor
            currentColumn = column
            currentRow = row
            path = CGMutablePath()
            path?.move(to: dot.position)
            visitedPoints = [(column: column, row: row, point: dot.position)]
            
            currentLine = SKShapeNode(path: path!)
            currentLine?.strokeColor = startColor ?? .white
            currentLine?.lineWidth = 6
            addChild(currentLine!)
        } else if let touchedNode = atPoint(location) as? SKLabelNode, let nodeName = touchedNode.name, nodeName.starts(with: "puzzle_") {
            if let index = Int(nodeName.split(separator: "_").last!) {
                selectedPuzzleIndex = index
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let currentLine = currentLine, let startColor = startColor else { return }
        let location = touch.location(in: self)
        
        if let (column, row) = columnAndRowForPoint(location) {
            let nextPoint = pointForColumn(column, row: row)
            
            if let existingColor = dots[row][column]?.fillColor, existingColor == startColor {
                // If moving to a dot of the same color
                if visitedPoints.last?.column != column || visitedPoints.last?.row != row {
                    path?.addLine(to: nextPoint)
                    currentLine.path = path
                    visitedPoints.append((column: column, row: row, point: nextPoint))
                    currentColumn = column
                    currentRow = row
                }
            } else if visitedPoints.contains(where: { $0.column == column && $0.row == row }) {
                // Allow moving back along the path
                if let lastIndex = visitedPoints.lastIndex(where: { $0.column == column && $0.row == row }) {
                    visitedPoints.removeLast(visitedPoints.count - lastIndex - 1)
                    let newPath = CGMutablePath()
                    newPath.move(to: visitedPoints.first!.point)
                    for point in visitedPoints.dropFirst() {
                        newPath.addLine(to: point.point)
                    }
                    currentLine.path = newPath
                    self.path = newPath
                    self.currentColumn = column
                    self.currentRow = row
                }
            } else {
                // Ensure lines are drawn only along hexagon edges
                let dx = abs(column - currentColumn!)
                let dy = abs(row - currentRow!)
                if (dx == 1 && dy == 0) || (dx == 0 && dy == 1) || (dx == 1 && dy == 1) {
                    if visitedPoints.last?.column != column || visitedPoints.last?.row != row {
                        // Check if the next point is a dot
                        if dots[row][column] == nil {
                            path?.addLine(to: nextPoint)
                            currentLine.path = path
                            visitedPoints.append((column: column, row: row, point: nextPoint))
                            currentColumn = column
                            currentRow = row
                            
                            // Check for line cutting
                            for line in lines {
                                if let intersected = line.path?.intersects(CGPath(rect: path!.boundingBoxOfPath, transform: nil)), intersected {
                                    line.removeFromParent()
                                    lines.removeAll { $0 == line }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            path?.addLine(to: location)
            currentLine.path = path
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if let (column, row) = columnAndRowForPoint(location),
           let endDot = dots[row][column], let startDot = startDot,
           endDot != startDot, endDot.fillColor == startColor {
            path?.addLine(to: endDot.position)
            currentLine?.path = path
            lines.append(currentLine!)
        } else {
            currentLine?.removeFromParent()
        }
        
        path = nil
        self.currentLine = nil
        self.startDot = nil
        self.startColor = nil
        self.currentColumn = nil
        self.currentRow = nil
        self.visitedPoints.removeAll()
    }
}

struct Puzzle {
    let rows: Int
    let columns: Int
    let dots: [(row: Int, col: Int, color: UIColor)]
}

let puzzles = [
    Puzzle(rows: 5, columns: 5, dots: [(0, 0, .blue), (1, 0, .red), (1, 4, .yellow), (2, 1, .orange), (2, 3, .green), (3, 2, .yellow), (3, 4, .orange), (4, 1, .blue), (4, 3, .green), (4, 2, .red)]),
    Puzzle(rows: 6, columns: 6, dots: [(0, 1, .blue), (0, 4, .red), (1, 3, .yellow), (2, 0, .green), (2, 2, .orange), (2, 4, .blue), (3, 1, .yellow), (3, 3, .red), (4, 0, .orange), (4, 4, .green), (5, 2, .purple), (5, 5, .cyan)]),
    Puzzle(rows: 7, columns: 7, dots: [(0, 0, .green), (0, 3, .red), (1, 1, .yellow), (1, 4, .blue), (2, 2, .orange), (2, 3, .green), (3, 0, .yellow), (3, 4, .red), (4, 1, .blue), (4, 3, .orange), (5, 2, .purple), (5, 6, .cyan), (6, 5, .magenta), (6, 0, .brown)])
]
