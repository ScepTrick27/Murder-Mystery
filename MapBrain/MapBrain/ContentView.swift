//
//  ContentView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Title
                Text("PICK YOUR PATH")
                    .font(.custom("Orbitron-Regular", size: 100))
                    .foregroundColor(Color(hex: "#78CCE2"))
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                
                GeometryReader { geometry in
                    HStack {
                        // Brain View
                        BrainView()
                            .scaleEffect(0.8) // Scale down the BrainView
                            .offset(y: -100)
                            .offset(x: -140)
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.8)
                        
                        Spacer()
                        
                        VStack {
                            // Centering Index View and Continue Button
                            Spacer()
                            
                            VStack {
                                // Index View
                                IndexView()
                                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.57)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(10)
                                
                                Spacer()
                                
                                // Continue Button
                                Button(action: {
                                    // Action to continue
                                }) {
                                    Text("CONTINUE >")
                                        .font(.custom("Orbitron-ExtraBold", size: 30))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .shadow(radius: 5)
                                }
                                .padding(.top, 20)
                            }
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

