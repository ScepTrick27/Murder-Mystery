//
//  IndexView.swift
//  MapBrain
//
//  Created by Mirena Veleva on 19/06/2024.
//

// IndexView.swift

import SwiftUI

struct IndexView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("INDEX")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color(hex: "#78CCE2"))
                .padding(.top, 20)
                .padding(.bottom, 40)
            
            // Core Memories
            HStack(alignment: .center, spacing: 20) {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 100, height: 100)
                Text("CORE\nMEMORIES")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Important Moments
            HStack(alignment: .center, spacing: 20) {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 60, height: 60)
                Text("IMPORTANT\nMOMENTS")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Surface Memories
            HStack(alignment: .center, spacing: 20) {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 30, height: 30)
                Text("SURFACE\nMEMORIES")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding()
        .background(Color(hex: "#78CCE2").opacity(0.2))
        .cornerRadius(10)
        .ignoresSafeArea()
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
