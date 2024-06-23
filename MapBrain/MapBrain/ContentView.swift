//
//  ContentView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 18/06/2024.
//
// ContentView.swift

import SwiftUI

struct ContentView: View {
    @State private var selectedGroup: Int? = nil  // Track the selected group

    var body: some View {
        NavigationView {
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
                        ZStack {
                            // Brain View
                            BrainView(selectedGroup: $selectedGroup)  // Provide the binding
                                .scaleEffect(0.8) // Scale down the BrainView
                                .offset(y: -140)
                                .offset(x: -410)
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.8)

                            // Overlaying Texts
                            Text("MOTIVE")
                                .font(.custom("Orbitron-Regular", size: 30))
                                .foregroundColor(.white)
                                .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.03)
                            
                            Text("RELATIONSHIPS")
                                .font(.custom("Orbitron-Regular", size: 30))
                                .foregroundColor(.white)
                                .position(x: geometry.size.width * 0.16, y: geometry.size.height * 1)
                            
                            Text("LOCATION")
                                .font(.custom("Orbitron-Regular", size: 30))
                                .foregroundColor(.white)
                                .position(x: geometry.size.width * 0.6, y: geometry.size.height * 1)
                        }

                        HStack {
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
                                    if let selectedGroup = selectedGroup {
                                        NavigationLink(
                                            destination: destinationView(for: selectedGroup)
                                        ) {
                                            Text("CONTINUE >")
                                                .font(.custom("Orbitron-ExtraBold", size: 30))
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color.blue)
                                                .shadow(radius: 5)
                                        }
                                        .padding(.top, 20)
                                    }
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
        .navigationViewStyle(StackNavigationViewStyle()) // Ensure proper navigation style for different devices
    }

    @ViewBuilder
    private func destinationView(for group: Int) -> some View {
        if group == 3 {
            JackBlackLocationView()
        } else if group == 1 {
            JackBlackMotiveView()
        } else {
            Text("Unknown Group") // Default case if needed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
