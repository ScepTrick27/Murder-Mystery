//  ContentView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var evidence = ["img1", "img2", "", "", "", ""]
    @State private var isEditing = false
    @State private var timerCount = 180
    @State private var lives = 2
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            // Background Image
            Image("background-01")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Top Bar
                HStack {
                    Button("Exit Chip") {
                        // Action for exit button
                    }
                    .padding()
                    .background(Color(hex: "#3299A8"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()

                    Spacer()
                    
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(Color(hex: "#0FFFFF"))
                        Text("⏳ \(timerFormatted)")
                            .font(.title)
                            .foregroundColor(Color(hex: "#0FFFFF"))
                    }
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(8)
                }

                Spacer()

                HStack {
                    // Left side buttons
                    VStack {
                        Spacer()
                        NavigationLink(destination: MapView()) {
                            Label("Map", systemImage: "map")
                                .labelStyle(VerticalLabelStyle())
                                .foregroundColor(Color(hex: "#0FFFFF"))
                        }
                        NavigationLink(destination: MemoryView()) {
                            Label("Memory View", systemImage: "memorychip")
                                .labelStyle(VerticalLabelStyle())
                                .foregroundColor(Color(hex: "#0FFFFF"))
                        }
                        NavigationLink(destination: EvidenceView()) {
                            Label("Evidence", systemImage: "tray.full")
                                .labelStyle(VerticalLabelStyle())
                                .foregroundColor(Color(hex: "#0FFFFF"))
                        }
                        NavigationLink(destination: InfoView()) {
                            Label("Info", systemImage: "info.circle")
                                .labelStyle(VerticalLabelStyle())
                                .foregroundColor(Color(hex: "#0FFFFF"))
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Evidence grid
                    VStack {
                        Text("EVIDENCE PILE")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        ForEach(0..<2) { rowIndex in
                            HStack {
                                ForEach(0..<3) { colIndex in
                                    evidenceBox(for: rowIndex * 3 + colIndex)
                                }
                            }
                        }
                        HStack {
                            Spacer()
                            Button(isEditing ? "Done" : "Edit") {
                                isEditing.toggle()
                            }
                            .padding()
                            .background(Color(hex: "#3299A8"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.top, 20) // Additional padding to move away from evidence
                            Spacer()
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .onAppear(perform: startTimer)
        }
    }

    var timerFormatted: String {
        let minutes = timerCount / 60
        let seconds = timerCount % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func evidenceBox(for index: Int) -> some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .stroke(Color(hex: "#0FFFFF"), lineWidth: 2) // Border-only
                .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7) // Adjusted size
                .overlay(
                    VStack {
                        if let imageName = evidence[safe: index], !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7)
                                .clipped()
                        } else {
                            Rectangle()
                                .stroke(Color(hex: "#0FFFFF"), lineWidth: 0) // Empty box as border-only
                                .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7)
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
        .padding(5) // Padding between evidence boxes
    }
    
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

struct MapView: View {
    var body: some View {
        Text("Map View")
    }
}

struct MemoryView: View {
    var body: some View {
        Text("Memory View")
    }
}

struct EvidenceView: View {
    var body: some View {
        Text("Evidence View")
    }
}

struct InfoView: View {
    var body: some View {
        Text("Info View")
    }
}

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}

// Color extension to use hex values
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
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

// Safe array access extension
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
