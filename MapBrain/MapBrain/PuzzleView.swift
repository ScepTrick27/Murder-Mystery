//
//  PuzzleView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//

import SwiftUI

struct PuzzleView: View {
    var onPuzzleSolved: () -> Void
    
    var body: some View {
        VStack {
            Text("Solve the Puzzle")
            Button("Solve") {
                onPuzzleSolved()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(onPuzzleSolved: {})
    }
}
