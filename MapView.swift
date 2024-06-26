//
//  MapView.swift
//  Project-MM
//
//  Created by Kyle Osei on 26/06/2024.
//

import SwiftUI

// This struct defines the MapView, which displays a locked message and a button to unlock a memory chip.
struct MapView: View {
    var body: some View {
        ZStack { // This overlays views on top of each other.
            VStack { // This stacks views vertically.
                Spacer() // This adds flexible space, pushing the content to the center vertically.

                // Locked message
                VStack(spacing: 20) { // Stacks views vertically with spacing between them.
                    HStack { // Stacks views horizontally.
                        Text("LOCKED") // Displays the text "LOCKED".
                            .font(.system(size: 50, weight: .bold)) // Sets the font size and weight.
                            .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color using a custom hex color.
                        
                        Image(systemName: "lock.fill") // Displays a system image of a filled lock.
                            .resizable() // Makes the image resizable.
                            .frame(width: 40, height: 40) // Sets the frame size.
                            .foregroundColor(Color(hex: "#0FFFFF")) // Sets the image color using a custom hex color.
                    }
                    
                    Text("You have reached Jack's Important Memories. If you want to access them, you need to restore this part of the memory chip. Are you up for the challenge?")
                        .font(.system(size: 20)) // Sets the font size.
                        .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color using a custom hex color.
                        .multilineTextAlignment(.center) // Aligns the text to the center.
                        .padding(.horizontal, 40) // Adds horizontal padding.
                    
                    Button(action: {
                        // Action for the button
                    }) {
                        Text("PLAY TO UNLOCK") // Button text.
                            .font(.system(size: 25, weight: .bold)) // Sets the font size and weight.
                            .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text color using a custom hex color.
                            .padding() // Adds padding inside the button.
                            .frame(width: 300, height: 60) // Sets the button size.
                            .background(Color(hex: "#0E1D21")) // Sets the background color using a custom hex color.
                            .cornerRadius(10) // Adds rounded corners.
                            .overlay( // Adds a border overlay with rounded corners.
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "#0FFFFF"), lineWidth: 2)
                            )
                    }
                }
                .padding() // Adds padding around the locked message.
                
                Spacer() // Adds flexible space below the content.
            }
            .padding() // Adds padding around the vertical stack.
        }
    }
}

// This struct is for previewing the MapView in Xcode.
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
