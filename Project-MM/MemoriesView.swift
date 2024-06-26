//  MemoriesView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct Memory: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var highlights: String
    var imageName: String
}

struct MemoriesView: View {
    @State private var isAdded: Bool = false
    let memories: [Memory] = [
        Memory(title: "Jane's Party", date: "12/05/2018, 2:05", highlights: """
            • Max was there the whole night.
            • Jane seemed annoyed at Samantha.
            • Samantha sneaked off around 2:00 AM. Came back an hour later.
            • Max was there the whole night.
            """, imageName: "party_image"),
        Memory(title: "John's Weapon", date: "01/01/2019, 3:30", highlights: """
            • Example highlight 1.
            • Example highlight 2.
            • Example highlight 3.
            • Example highlight 4.
            • Example highlight 5.
            """, imageName: "foot")
    ]

    var body: some View {
        ZStack {
            // Background Image
            Image("background-01")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Memory Carousel
                TabView {
                    ForEach(memories) { memory in
                        VStack(alignment: .leading, spacing: 50) {
                            // Bordered Memory Content
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.cyan.opacity(0.9), lineWidth: 4) // Thicker border
                                    .background(Color.clear)
                                    .cornerRadius(10)
                                    .shadow(color: Color(hex: "#0FFFFF").opacity(0.9), radius: 20, x: 0, y: 0)

                                VStack(alignment: .leading, spacing: 20) {
                                    // Title and Date
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.cyan.opacity(0.9), lineWidth: 4) // Thicker border
                                                .background(Color.clear)
                                                .cornerRadius(5)
                                                .shadow(color: Color(hex: "#0FFFFF").opacity(0.9), radius: 15, x: 0, y: 0)
                                            
                                            HStack {
                                                Text(memory.title)
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                                    .padding(.horizontal, 10)
                                                
                                                Text(memory.date)
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
                                        Image(memory.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 300)
                                        
                                        // Highlights
                                        VStack(alignment: .leading) {
                                            Text("HIGHLIGHTS")
                                                .foregroundColor(Color.cyan)
                                                .font(.system(size: 50, weight: .bold)) // Much larger font size for highlights title
                                                .padding(.bottom, 20)
                                            
                                            Text(memory.highlights)
                                                .foregroundColor(.white)
                                                .font(.system(size: 30)) // Much larger font size for highlights text
                                                .multilineTextAlignment(.leading)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                    .padding(.bottom, 10)

                                    // Witnesses and Clues
                                    HStack(spacing: 50) {
                                        VStack {
                                            Text("WITNESSES")
                                                .foregroundColor(.white)
                                                .font(.system(size: 40, weight: .bold)) // Larger font size
                                                .padding(.bottom, 20)
                                            
                                            HStack(spacing: 40) {
                                                VStack {
                                                    Image("samantha") // Replace with actual image names
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 70, height: 70)
                                                        .clipShape(Circle())
                                                    Text("SAMANTHA")
                                                        .foregroundColor(.white)
                                                        .font(.title3) // Larger font size
                                                }
                                                
                                                VStack {
                                                    Image("john")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 70, height: 70)
                                                        .clipShape(Circle())
                                                    Text("JOHN")
                                                        .foregroundColor(.white)
                                                        .font(.title3) // Larger font size
                                                }
                                            }
                                        }

                                        VStack {
                                            Text("CLUES")
                                                .foregroundColor(.white)
                                                .font(.system(size: 40, weight: .bold)) // Larger font size
                                                .padding(.bottom, 20)

                                            VStack {
                                                ZStack {
                                                    Circle()
                                                        .fill(Color.cyan.opacity(0.5))
                                                        .frame(width: 100, height: 100)
                                                    
                                                    Image(systemName: "camera")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundColor(.white)
                                                        .frame(width: 50, height: 50)
                                                }
                                                
                                                Text("CCTV FOOTAGE")
                                                    .foregroundColor(.white)
                                                    .font(.title3) // Larger font size
                                            }
                                        }
                                    }

                                    Spacer()

                                    // Add to Pile Button
                                    HStack {
                                        Spacer()
                                        
                                        Button(action: {
                                            isAdded.toggle()
                                        }) {
                                            Text(isAdded ? "ADDED ✓" : "ADD TO PILE")
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(width: 200, height: 60)
                                                .background(isAdded ? Color.green : Color(hex: "#0E1D21"))
                                                .cornerRadius(10)
                                                .font(.headline)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .padding()
                        }
                        .padding(.top, 10) // Ensure top padding is enough to show the border
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure it fits the screen
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .padding(.top, 20) // Ensure top padding is enough to show the border

                Spacer()
            }
        }
    }
}

#Preview {
    MemoriesView()
}
