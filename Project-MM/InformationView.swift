//
//  InformationView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        ZStack {
//            // Background Image
//            Image("background-01")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Information Content
                HStack(alignment: .top) {
                    // Nodes Image
                    Image("nodes") // Placeholder image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400) // Adjust the size as needed
                        .padding(.leading, 20)

                    // Instructions
                    VStack(alignment: .leading) {
                        Text("INSTRUCTIONS")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                        
                        Text("• You have 3 minutes until the path gets corrupted.\n\n• Follow the brain nodes to learn more about your chosen information.\n\n• Extract evidence by adding it to your evidence pile. Any evidence not in the pile by the end of the time limit gets destroyed.\n\n• Each brain layer has a restoration puzzle, solve them to access the memories there.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()

                    Spacer()
                }

                Spacer()
            }
        }
    }
}

#Preview {
    InformationView()
}
