//
//  ReusableViews.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

// View to display a timer with an icon
struct TimerView: View {
    var time: String // Time string to display

    var body: some View {
        HStack {
            Image(systemName: "timer") // Timer icon
            Text(time)
                .font(.title) // Time text with title font
        }
        .foregroundColor(Color(hex: "#0FFFFF")) // Cyan color for the text and icon
        .padding() // Padding around the HStack
        .background(Color(hex: "#78CCE2").opacity(0.2)) // Light blue background with opacity
    }
}

// View to display the number of lives with hearts
struct LivesView: View {
    var lives: Int // Number of lives to display

    var body: some View {
        HStack {
            // Display filled hearts for the number of lives
            ForEach(0..<lives, id: \.self) { _ in
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(hex: "#0FFFFF")) // Cyan color for filled hearts
            }
            // Display empty hearts for the remaining lives (up to 3)
            ForEach(lives..<3, id: \.self) { _ in
                Image(systemName: "heart")
                    .foregroundColor(Color(hex: "#0FFFFF")) // Cyan color for empty hearts
            }
        }
        Text("Lives")
            .foregroundColor(.white) // White color for the "Lives" text
    }
}

// Vertical menu with buttons to switch views
struct VerticalMenu: View {
    @Binding var currentView: String // Binding to track the current view

    var body: some View {
        VStack(spacing: 15) { // Vertical stack with 15 points spacing
            Button(action: {
                currentView = "Map" // Switch to the Map view
            }) {
                CircularButton(label: "Map", systemImage: "map", bgColor: currentView == "Map" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"), fgColor: currentView == "Map" ? Color(hex: "#0E1D21") : Color(hex: "#0FFFFF"))
            }
            Button(action: {
                currentView = "Memory" // Switch to the Memory view
            }) {
                CircularButton(label: "Memory View", systemImage: "iphone", bgColor: currentView == "Memory" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"), fgColor: currentView == "Memory" ? Color(hex: "#0E1D21") : Color(hex: "#0FFFFF"))
            }
            Button(action: {
                currentView = "Evidence" // Switch to the Evidence view
            }) {
                CircularButton(label: "Evidence", systemImage: "tray.full", bgColor: currentView == "Evidence" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"), fgColor: currentView == "Evidence" ? Color(hex: "#0E1D21") : Color(hex: "#0FFFFF"))
            }
            Button(action: {
                currentView = "Info" // Switch to the Info view
            }) {
                CircularButton(label: "Info", systemImage: "info.circle", bgColor: currentView == "Info" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"), fgColor: currentView == "Info" ? Color(hex: "#0E1D21") : Color(hex: "#0FFFFF"))
            }
        }
        .padding(.leading, 8) // Padding on the leading (left) side
    }
}

// Custom circular button with label and system image
struct CircularButton: View {
    var label: String // Label text for the button
    var systemImage: String // System image name for the button
    var bgColor: Color // Background color for the button
    var fgColor: Color // Foreground color for the image

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(bgColor) // Fill circle with background color
                    .frame(width: 50, height: 50) // Circle size
                Image(systemName: systemImage)
                    .foregroundColor(fgColor) // Foreground color for the image
            }
            Text(label)
                .foregroundColor(Color.white) // White color for the label text
                .font(.caption) // Caption font for the label
        }
        .padding(.horizontal, 4) // Horizontal padding around the VStack
    }
}

#Preview {
    VerticalMenu(currentView: .constant("Evidence")) // Preview with the Evidence view selected
}
