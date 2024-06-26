//
//  MemoriesView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

// This struct defines a Memory object with an ID, title, date, highlights, and image name.
struct Memory: Identifiable {
    var id = UUID() // Generates a unique ID for each memory.
    var title: String // Title of the memory.
    var date: String // Date of the memory.
    var highlights: String // Highlights or important notes about the memory.
    var imageName: String // Name of the image associated with the memory.
}

// This is the main view that shows the memories.
struct MemoriesView: View {
    @State private var isAdded: Bool = false // This state variable tracks if the memory has been added to the pile.
    let memories: [Memory] = [ // This is an array of Memory objects.
        Memory(title: "Jane's Party", date: "12/05/2018, 2:05", highlights: """
            • Max was there the whole night.
            • Jane seemed annoyed at Samantha.
            • Samantha sneaked off around 2:00 AM. Came back an hour later.
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
        ZStack { // This puts views on top of each other.
            VStack { // This stacks views vertically.
                Spacer()

                // Memory Carousel
                TabView { // This creates a swipeable tab view.
                    ForEach(memories) { memory in // Loops through each memory.
                        VStack(alignment: .leading, spacing: 20) { // Stacks views vertically with spacing.
                            // Bordered Memory Content
                            ZStack { // This puts views on top of each other.
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "#0FFFFF").opacity(0.9), lineWidth: 1) // This creates a border.
                                    .background(Color.clear)
                                    .cornerRadius(10)
                                    .shadow(color: Color(hex: "#0FFFFF").opacity(0.9), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading, spacing: 8) { // Stacks views vertically with spacing.
                                    // Title and Date
                                    HStack { // Stacks views horizontally.
                                        Text(memory.title) // Shows the memory title.
                                            .foregroundColor(.white) // Sets the text color to white.
                                            .font(.system(size: 40, weight: .bold)) // Sets the font size and weight.
                                            .padding([.horizontal, .top], 20) // Adds padding around the text.
                                        
                                        Spacer() // Adds space between the title and date.
                                        
                                        Text(memory.date) // Shows the memory date.
                                            .foregroundColor(.white) // Sets the text color to white.
                                            .font(.system(size: 20)) // Sets the font size.
                                            .padding([.horizontal, .top], 20) // Adds padding around the text.
                                    }
                                    
                                    HStack(alignment: .top, spacing: 20) { // Stacks views horizontally with top alignment and spacing.
                                        // Image
                                        Image(memory.imageName) // Displays the image for the memory.
                                            .resizable() // Makes the image resizable.
                                            .scaledToFit() // Scales the image to fit its frame.
                                            .frame(width: 250, height: 250) // Sets the frame size.
                                            .padding(.leading, 20) // Adds padding to the left side.
                                        
                                        // Highlights
                                        VStack(alignment: .leading, spacing: 8) { // Stacks views vertically with alignment and spacing.
                                            Text("HIGHLIGHTS") // Displays the highlights header.
                                                .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color.
                                                .font(.system(size: 30, weight: .bold)) // Sets the font size and weight.
                                                .padding(.bottom, 10) // Adds bottom padding.
                                            
                                            Text(memory.highlights) // Displays the highlights text.
                                                .foregroundColor(.white) // Sets the text color to white.
                                                .font(.system(size: 18)) // Sets the font size.
                                                .multilineTextAlignment(.leading) // Aligns the text to the left.
                                        }
                                        .padding([.trailing, .top], 20) // Adds padding to the right and top sides.
                                    }
                                    
                                    HStack(spacing: 30) { // Stacks views horizontally with spacing.
                                        VStack { // Stacks views vertically.
                                            Text("WITNESSES") // Displays the witnesses header.
                                                .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color.
                                                .font(.system(size: 24, weight: .bold)) // Sets the font size and weight.
                                                .padding(.bottom, 8) // Adds bottom padding.
                                            
                                            HStack(spacing: 15) { // Stacks views horizontally with spacing.
                                                VStack { // Stacks views vertically.
                                                    Image("samantha") // Displays the image for Samantha.
                                                        .resizable() // Makes the image resizable.
                                                        .scaledToFit() // Scales the image to fit its frame.
                                                        .frame(width: 70, height: 70) // Sets the frame size.
                                                        .clipShape(Circle()) // Clips the image to a circle.
                                                    Text("SAMANTHA") // Displays the text "SAMANTHA".
                                                        .foregroundColor(.white) // Sets the text color to white.
                                                        .font(.system(size: 18)) // Sets the font size.
                                                }
                                                
                                                VStack { // Stacks views vertically.
                                                    Image("john") // Displays the image for John.
                                                        .resizable() // Makes the image resizable.
                                                        .scaledToFit() // Scales the image to fit its frame.
                                                        .frame(width: 70, height: 70) // Sets the frame size.
                                                        .clipShape(Circle()) // Clips the image to a circle.
                                                    Text("JOHN") // Displays the text "JOHN".
                                                        .foregroundColor(.white) // Sets the text color to white.
                                                        .font(.system(size: 18)) // Sets the font size.
                                                }
                                            }
                                        }

                                        VStack { // Stacks views vertically.
                                            Text("CLUES") // Displays the clues header.
                                                .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color.
                                                .font(.system(size: 24, weight: .bold)) // Sets the font size and weight.
                                                .padding(.bottom, 8) // Adds bottom padding.

                                            VStack { // Stacks views vertically.
                                                ZStack { // Puts views on top of each other.
                                                    Circle() // Creates a circular shape.
                                                        .fill(Color(hex: "#0FFFFF").opacity(0.5)) // Fills the circle with color.
                                                        .frame(width: 80, height: 80) // Sets the frame size.
                                                    
                                                    Image(systemName: "camera") // Displays a system image of a camera.
                                                        .resizable() // Makes the image resizable.
                                                        .scaledToFit() // Scales the image to fit its frame.
                                                        .foregroundColor(.white) // Sets the image color to white.
                                                        .frame(width: 40, height: 40) // Sets the frame size.
                                                }
                                                
                                                Text("CCTV FOOTAGE") // Displays the text "CCTV FOOTAGE".
                                                    .foregroundColor(.white) // Sets the text color to white.
                                                    .font(.system(size: 18)) // Sets the font size.
                                            }
                                        }
                                    }
                                    .padding([.leading, .trailing, .bottom], 20) // Adds padding to the left, right, and bottom sides.

                                    Spacer()

                                    // Add to Pile Button
                                    HStack { // Stacks views horizontally.
                                        Spacer()
                                        
                                        Button(action: {
                                            isAdded.toggle() // Toggles the state variable isAdded.
                                        }) {
                                            Text(isAdded ? "ADDED ✓" : "ADD TO PILE") // Displays the button text based on isAdded state.
                                                .foregroundColor(.white) // Sets the text color to white.
                                                .padding() // Adds padding around the text.
                                                .frame(width: 200, height: 50) // Sets the frame size.
                                                .background(isAdded ? Color.green : Color(hex: "#0E1D21")) // Sets the background color based on isAdded state.
                                                .cornerRadius(10) // Adds rounded corners to the button.
                                                .font(.headline) // Sets the font style.
                                        }
                                    }
                                    .padding(20) // Adds padding around the button.
                                }
                            }
                            .padding(20) // Adds padding around the bordered content.
                        }
                        .padding(.top, 8) // Adds top padding to the memory view.
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Sets the frame size to fill available space.
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // Sets the tab view style.
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Adds dots to indicate pages.

                Spacer()
            }
        }
    }
}

// This struct is for previewing the MemoriesView in Xcode.
#Preview {
    MemoriesView()
}
