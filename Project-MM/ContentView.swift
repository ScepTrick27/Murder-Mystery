//  ContentView.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var evidence = ["img1", "img2", "", "", "", ""]
    @State private var isEditing = false
    @State private var timerCount = 165
    @State private var lives = 2
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            // Background Image
            Image("background-01")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 10) {
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
                        .foregroundColor(Color.white)
                    }

                    Spacer()

                    // Lives and Timer
                    HStack(spacing: 20) {
                        LivesView(lives: lives)
                        TimerView(time: timerFormatted)
                            .padding(20)
                    }
                    .padding(20)
                }
                .padding([.leading, .trailing], 10)
                .padding(.top, 10)

                Spacer()

                HStack(spacing: 8) {
                    // Left side buttons
                    VerticalMenu()
                        .padding(.leading, 8)

                    // Evidence Pile Section
                    VStack {
                        Text("EVIDENCE PILE")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .center)

                        VStack(spacing: 10) {
                            ForEach(0..<2) { rowIndex in
                                HStack(spacing: 10) {
                                    ForEach(0..<3) { colIndex in
                                        evidenceBox(for: rowIndex * 3 + colIndex)
                                    }
                                }
                            }
                        }
                        .padding([.leading, .trailing], 8)

                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Label(isEditing ? "DONE" : "EDIT", systemImage: isEditing ? "checkmark" : "pencil")
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(isEditing ? Color.green : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .font(.headline)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.leading, 8)

                    Spacer()
                }

                Spacer()
            }
        }
        .onAppear(perform: startTimer)
    }

    var timerFormatted: String {
        let minutes = timerCount / 60
        let seconds = timerCount % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

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


struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
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

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

