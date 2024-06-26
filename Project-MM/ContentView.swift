//
//  ContentView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

// This struct defines the main content view of the app.
struct ContentView: View {
    @State private var evidence = ["img1", "img2", "", "", "", ""] // An array to store evidence images.
    @State private var isEditing = false // A state variable to track if the user is in editing mode.
    @State private var timerCount = 165 // A state variable for the timer count in seconds.
    @State private var lives = 2 // A state variable for the number of lives.
    @State private var timer: Timer? // A timer to count down the timerCount.
    @State private var currentView: String = "Home" // A state variable to track the current view being displayed.

    var body: some View {
        GeometryReader { geometry in // Provides access to the size of the parent view.
            ZStack {
                // Background Image
                Image("background-01")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Ensures the background image covers the entire screen.

                VStack(spacing: 0) {
                    // Top Bar
                    HStack {
                        // Exit Chip button
                        Button(action: {
                            // Action for exit button
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("EXIT CHIP")
                            }
                            .foregroundColor(Color(hex: "#0FFFFF")) // Sets the text and icon color.
                            .font(.custom("Orbitron-Regular", size: 24)) // Sets a custom font.
                            .padding(25)
                        }

                        Spacer()

                        // Lives and Timer
                        HStack(spacing: 20) {
                            LivesView(lives: lives) // Custom view to display lives.
                            TimerView(time: timerFormatted) // Custom view to display the timer.
                                .padding(20)
                        }
                        .padding(20)
                    }
                    .padding([.leading, .trailing], 10)
                    .padding(.top, 10)

                    Spacer()

                    HStack(spacing: 8) {
                        // Left side buttons
                        VerticalMenu(currentView: $currentView) // Custom view for the vertical menu.
                            .padding(.leading, 8)

                        // Main Content
                        VStack {
                            if currentView == "Home" {
                                homeContent // Displays the home content.
                            } else if currentView == "Map" {
                                MapViewWrapper() // Displays the map view.
                            } else if currentView == "Memory" {
                                MemoriesViewWrapper() // Displays the memories view.
                            } else if currentView == "Evidence" {
                                evidenceContent // Displays the evidence content.
                            } else if currentView == "Info" {
                                InformationViewWrapper() // Displays the information view.
                            }
                        }
                        .transition(.identity) // Disable animations

                        Spacer()
                    }

                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // Sets the frame to the size of the parent view.
            }
        }
        .onAppear(perform: startTimer) // Starts the timer when the view appears.
    }

    // Home content view
    var homeContent: some View {
        VStack {
            Text("EVIDENCE PILE")
                .font(.custom("Orbitron-Regular", size: 30))
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .center)

            VStack(spacing: 10) {
                ForEach(0..<2) { rowIndex in
                    HStack(spacing: 10) {
                        ForEach(0..<3) { colIndex in
                            evidenceBox(for: rowIndex * 3 + colIndex) // Calls evidenceBox for each item.
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 8)

            Button(action: {
                isEditing.toggle() // Toggles editing mode.
            }) {
                Label(isEditing ? "DONE" : "EDIT", systemImage: isEditing ? "checkmark" : "pencil")
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(isEditing ? Color.green : Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .font(.custom("Orbitron-Regular", size: 20))
            }
            .padding(.top, 20)
        }
        .padding(.leading, 8)
    }

    // Evidence content view
    var evidenceContent: some View {
        VStack {
            Text("EVIDENCE PILE")
                .font(.custom("Orbitron-Regular", size: 30))
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .center)

            VStack(spacing: 10) {
                ForEach(0..<2) { rowIndex in
                    HStack(spacing: 10) {
                        ForEach(0..<3) { colIndex in
                            evidenceBox(for: rowIndex * 3 + colIndex) // Calls evidenceBox for each item.
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 8)

            Button(action: {
                isEditing.toggle() // Toggles editing mode.
            }) {
                Label(isEditing ? "DONE" : "EDIT", systemImage: isEditing ? "checkmark" : "pencil")
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(isEditing ? Color.green : Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .font(.custom("Orbitron-Regular", size: 20))
            }
            .padding(.top, 20)
        }
        .padding(.leading, 8)
    }

    // Formatter for the timer
    var timerFormatted: String {
        let minutes = timerCount / 60
        let seconds = timerCount % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // View for an evidence box
    func evidenceBox(for index: Int) -> some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .stroke(Color(hex: "#0FFFFF"), lineWidth: 2) // Border-only, no fill
                .frame(width: UIScreen.main.bounds.width / 3.75, height: UIScreen.main.bounds.height / 6)
                .overlay(
                    VStack {
                        if let imageName = evidence[safe: index], !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width / 3.75, height: UIScreen.main.bounds.height / 6)
                                .clipped()
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: UIScreen.main.bounds.width / 3.75, height: UIScreen.main.bounds.height / 6)
                        }
                    }
                )
            if isEditing {
                Button(action: {
                    evidence[index] = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .padding([.top, .trailing], 5)
                }
            }
        }
        .padding(5)
    }

    // Starts the timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerCount > 0 {
                timerCount -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
}

// Wrapper view for the MapView
struct MapViewWrapper: View {
    var body: some View {
        MapView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
    }
}

// Wrapper view for the MemoriesView
struct MemoriesViewWrapper: View {
    var body: some View {
        MemoriesView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
    }
}

// Wrapper view for the EvidenceView
struct EvidenceView: View {
    var body: some View {
        Text("Evidence View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
    }
}

// Wrapper view for the InformationView
struct InformationViewWrapper: View {
    var body: some View {
        InformationView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
    }
}

// Extension to initialize Color from a hex string
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
}

// Extension to safely access array elements
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
