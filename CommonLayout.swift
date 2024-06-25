//
//  CommonLayout.swift
//  Project-MM
//
//  Created by Kyle Osei on 25/06/2024.
//

import SwiftUI

struct CommonLayout<Content: View>: View {
    @Binding var currentView: String
    var content: Content

    init(currentView: Binding<String>, @ViewBuilder content: () -> Content) {
        self._currentView = currentView
        self.content = content()
    }

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
                        LivesView(lives: 2)
                        TimerView(time: "2:45")
                            .padding(20)
                    }
                    .padding(20)
                }
                .padding([.leading, .trailing], 10)
                .padding(.top, 10)

                Spacer()

                HStack(spacing: 8) {
                    // Left side buttons
                    VerticalMenu(currentView: $currentView)
                        .padding(.leading, 8)

                    // Main Content
                    content

                    Spacer()
                }

                Spacer()
            }
        }
    }
}

#Preview {
    CommonLayout(currentView: .constant("Home")) {
        Text("Home Content")
            .foregroundColor(.white)
    }
}
