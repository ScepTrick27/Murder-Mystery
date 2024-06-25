//
//  ReusableViews.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

// ReusableViews.swift
import SwiftUI

struct TimerView: View {
    var time: String

    var body: some View {
        HStack {
            Image(systemName: "timer")
            Text(time)
                .font(.title)
        }
        .foregroundColor(Color(hex: "#0FFFFF"))
        .padding()
        .background(Color(hex: "#003543"))
        .cornerRadius(8)
        .shadow(color: Color(hex: "#0FFFFF").opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct LivesView: View {
    var lives: Int

    var body: some View {
        HStack {
            ForEach(0..<lives) { _ in
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(hex: "#0FFFFF"))
            }
            ForEach(lives..<3) { _ in
                Image(systemName: "heart")
                    .foregroundColor(Color(hex: "#0FFFFF"))
            }
        }
        Text("Lives")
            .foregroundColor(.white)
    }
}

struct VerticalMenu: View {
    var body: some View {
        VStack(spacing: 15) {
            NavigationLink(destination: MapView()) {
                CircularButton(label: "Map", systemImage: "map", bgColor: Color(hex: "#0E1D21"))
            }
            NavigationLink(destination: MemoryView()) {
                CircularButton(label: "Memory View", systemImage: "iphone", bgColor: Color(hex: "#0E1D21"))
            }
            NavigationLink(destination: EvidenceView()) {
                EvidenceButton()
            }
            NavigationLink(destination: InformationView()) {
                CircularButton(label: "Info", systemImage: "info.circle", bgColor: Color(hex: "#0E1D21"))
            }
        }
        .padding(.leading, 8)
    }
}

struct CircularButton: View {
    var label: String
    var systemImage: String
    var bgColor: Color

    var body: some View {
        Button(action: {
            // Action for button
        }) {
            VStack {
                ZStack {
                    Circle()
                        .fill(bgColor)
                        .frame(width: 50, height: 50)
                    Image(systemName: systemImage)
                        .foregroundColor(Color(hex: "#0FFFFF"))
                }
                Text(label)
                    .foregroundColor(Color.white)
                    .font(.caption)
            }
        }
        .padding(.horizontal, 4)
    }
}

struct EvidenceButton: View {
    var body: some View {
        Button(action: {
            // Action for button
        }) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(hex: "#0FFFFF"))
                        .frame(width: 50, height: 50)
                    Image(systemName: "tray.full")
                        .foregroundColor(Color(hex: "#003D4D"))
                }
                Text("Evidence")
                    .foregroundColor(Color(hex: "#0FFFFF"))
                    .font(.caption)
            }
        }
        .padding(.horizontal, 4)
    }
}

