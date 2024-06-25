//  ReusableViews.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

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
        .background(Color(hex: "#78CCE2").opacity(0.2))
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
    @Binding var currentView: String

    var body: some View {
        VStack(spacing: 15) {
            Button(action: {
                currentView = "Map"
            }) {
                CircularButton(label: "Map", systemImage: "map", bgColor: currentView == "Map" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"))
            }
            Button(action: {
                currentView = "Memory"
            }) {
                CircularButton(label: "Memory View", systemImage: "iphone", bgColor: currentView == "Memory" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"))
            }
            Button(action: {
                currentView = "Evidence"
            }) {
                EvidenceButton(bgColor: currentView == "Evidence" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"))
            }
            Button(action: {
                currentView = "Info"
            }) {
                CircularButton(label: "Info", systemImage: "info.circle", bgColor: currentView == "Info" ? Color(hex: "#0FFFFF") : Color(hex: "#0E1D21"))
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
        .padding(.horizontal, 4)
    }
}

struct EvidenceButton: View {
    var bgColor: Color

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(bgColor)
                    .frame(width: 50, height: 50)
                Image(systemName: "tray.full")
                    .foregroundColor(Color(hex: "#003D4D"))
            }
            Text("Evidence")
                .foregroundColor(Color(hex: "#0FFFFF"))
                .font(.caption)
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    VerticalMenu(currentView: .constant("Evidence"))
}
