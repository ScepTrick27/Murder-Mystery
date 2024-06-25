//
//  MemoriesView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct MemoriesView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("background-01")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Top Bar with Exit Chip button, Timer and Lives
                HStack {
                    // Exit Chip button
                    Button(action: {
                        // Action for exit button
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("EXIT CHIP")
                        }
                        .foregroundColor(Color.white)
                    }

                    Spacer()

                    // Lives and Timer
                    HStack {
                        LivesView(lives: 2)
                        TimerView(time: "2:45")
                            .padding(20)
                    }
                }
                .padding()

                Spacer()

                // Memory View Content
                VStack(alignment: .leading, spacing: 20) {
                    // Bordered Memory Content
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.cyan.opacity(0.9), lineWidth: 2)
                            .background(Color.clear)
                            .cornerRadius(10)
                            .shadow(color: Color(hex: "#0FFFFF").opacity(0.9), radius: 10, x: 0, y: 0)

                        VStack(alignment: .leading, spacing: 20) {
                            // Title and Date
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.cyan.opacity(0.9), lineWidth: 2)
                                        .background(Color.clear)
                                        .cornerRadius(5)
                                        .shadow(color: Color(hex: "#0FFFFF").opacity(0.9), radius: 5, x: 0, y: 0)
                                    
                                    HStack {
                                        Text("JANE'S PARTY")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .padding(.horizontal, 10)
                                        
                                        Text("12/05/2018, 2:05")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .padding(.horizontal, 10)
                                    }
                                    .padding(.horizontal, 10)
                                }
                            }
                            .padding(.bottom, 10)
                            
                            HStack(alignment: .top) {
                                // Image
                                Image("party_image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 300)
                                
                                // Highlights
                                VStack(alignment: .leading) {
                                    Text("HIGHLIGHTS")
                                        .foregroundColor(Color.cyan)
                                        .font(.title2)
                                        .padding(.bottom, 10)
                                    
                                    Text("""
                                    • Max was there the whole night.
                                    • Jane seemed annoyed at Samantha.
                                    • Samantha sneaked off around 2:00 AM. Came back an hour later.
                                    • Max was there the whole night.
                                    • Jane seemed annoyed at Samantha.
                                    • Samantha sneaked off around 2:00 AM. Came back an hour later.
                                    • Max was there the whole night.
                                    • Jane seemed annoyed at Samantha.
                                    • Samantha sneaked off around 2:00 AM. Came back an hour later.
                                    """)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .padding(.bottom, 10)

                            // Witnesses and Clues
                            HStack {
                                VStack {
                                    Text("WITNESSES")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .padding(.bottom, 10)
                                    
                                    HStack {
                                        VStack {
                                            Image("samantha") // Replace with actual image names
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("SAMANTHA")
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 20)
                                        
                                        VStack {
                                            Image("john")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("JOHN")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding(.trailing, 40)

                                VStack {
                                    Text("CLUES")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .padding(.bottom, 10)

                                    VStack {
                                        ZStack {
                                            Circle()
                                                .fill(Color.cyan.opacity(0.5))
                                                .frame(width: 70, height: 70)
                                            
                                            Image(systemName: "camera")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 40)
                                        }
                                        
                                        Text("CCTV FOOTAGE")
                                            .foregroundColor(.white)
                                    }
                                }
                            }

                            Spacer()

                            // Add to Pile Button
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    // Action for Add to Pile button
                                }) {
                                    Text("ADD TO PILE")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 150)
                                        .background(Color(hex: "#0E1D21"))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
                .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    MemoriesView()
}
