//
//  MapView.swift
//  Project-MM
//
//  Created by Kyle Osei on 26/06/2024.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            
            
            VStack {
                Spacer()

                // Locked message
                VStack(spacing: 20) {
                    HStack {
                        Text("LOCKED")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(Color(hex: "#0FFFFF"))
                        
                        Image(systemName: "lock.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color(hex: "#0FFFFF"))
                    }
                    
                    Text("You have reached Jack's Important Memories. If you want to access them, you need to restore this part of the memory chip. Are you up for the challenge?")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "#0FFFFF"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        // Action for the button
                    }) {
                        Text("PLAY TO UNLOCK")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "#0FFFFF"))
                            .padding()
                            .frame(width: 300, height: 60)
                            .background(Color(hex: "#0E1D21"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "#0FFFFF"), lineWidth: 2)
                            )
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
