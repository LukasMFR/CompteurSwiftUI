//
//  ContentView.swift
//  CompteurWatch Watch App
//
//  Created by Lukas Mauffré on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counterValue: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(counterValue)")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white) // Ensure text color is visible on gradient
            
            HStack(spacing: 10) {
                // Use gradient backgrounds for buttons
                Button(action: {
                    self.counterValue -= 1
                }) {
                    Image(systemName: "minus")
                        .foregroundColor(.white) // Set the icon color to white for better visibility
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the frame with icon color
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(5)
                }
                
                Button(action: {
                    self.counterValue += 1
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white) // Set the icon color to white for better visibility
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the frame with icon color
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(5)
                }
            }
            
            Button(action: {
                self.counterValue = 0
            }) {
                Text("Reset")
                    .bold()
                    .foregroundColor(.white) // Ensure text color is visible on gradient
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the frame with icon color
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.red.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(5)
            }
        }
        // Define the frame of the VStack if necessary to fit the content
        // .frame(width: ... , height: ...)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
