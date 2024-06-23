//
//  JackBlackLocationView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 24/06/2024.
//

import SwiftUI

struct JackBlackLocationView: View {
    var body: some View {
        ZStack {
            // Background
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    // Icon
                    Image(systemName: "cpu")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .foregroundColor(Color(hex: "#78CCE2"))
                        .padding(.bottom, 20)
                    
                    // Title
                    Text("JACK BLACK - Location")
                        .font(.custom("Orbitron-Regular", size: 97))
                        .foregroundColor(Color(hex: "#78CCE2"))
                        .padding(.bottom, 40)
                    
                    // Instructions
                    VStack(alignment: .leading, spacing: 10) {
                        Text("INSTRUCTIONS")
                            .font(.custom("Orbitron-Regular", size: 34))
                            .foregroundColor(.white)
                            .padding(.bottom, 50.0)
                            .frame(maxWidth: .infinity, alignment: .center) // Center align the header
                        
                        Text("• You have 3 minutes until the chip gets corrupted.")
                            .font(.custom("Orbitron-Regular", size: 26))
                            .foregroundColor(.white)
                        
                        Text("• Follow the brain nodes to learn more and more about your chosen information.")
                            .font(.custom("Orbitron-Regular", size: 26))
                            .foregroundColor(.white)
                        
                        Text("• Extract evidence by dragging and dropping it into your evidence pile. Any evidence not in the pile by the end of the time limit gets destroyed.")
                            .font(.custom("Orbitron-Regular", size: 26))
                            .foregroundColor(.white)
                        
                        Text("• Each brain layer has a restoration puzzle, solve them to access the memories there.")
                            .font(.custom("Orbitron-Regular", size: 26))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 40)
                    .frame(width: geometry.size.width * 0.8) // Adjust the width as needed
                    .padding(.horizontal, 20)
                    
                    // Start Button
                    Button(action: {
                        // Handle start action
                    }) {
                        Text("START")
                            .font(.custom("Orbitron-Regular", size: 48))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 90)
                            .background(Color(hex: "#78CCE2").opacity(0.2))
                            .shadow(radius: 5)
                    }
                    
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // Center the VStack
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}

struct JackBlackLocationView_Previews: PreviewProvider {
    static var previews: some View {
        JackBlackLocationView()
    }
}
