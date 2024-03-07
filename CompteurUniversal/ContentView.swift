//
//  ContentView.swift
//  CompteurUniversal
//
//  Created by Lukas Mauffré on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counterValue: Int = 0 // Tracks the counter's value
    
    var body: some View {
        // Use ZStack to apply gradient background
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color("StartGradient"), Color("EndGradient")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all) // Apply gradient to all edges

            // Main content container
            VStack(spacing: 20) {
                // Display the current value of the counter
                Text("\(counterValue)")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.white)
                
                // Buttons for modifying the counter value
                HStack(spacing: 10) {
                    modifierButton(label: "-10", value: -10)
                    modifierButton(label: "-5", value: -5)
                    modifierButton(label: "-1", value: -1)
                    modifierButton(label: "+1", value: 1)
                    modifierButton(label: "+5", value: 5)
                    modifierButton(label: "+10", value: 10)
                }
                
                // Reset button
                Button(action: {
                    self.counterValue = 0
                }) {
                    Text("Remettre le compteur à zéro")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ResetStart"), Color("ResetEnd")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                }
            }
        }
    }
    
    // Helper function to create modifier buttons
    func modifierButton(label: String, value: Int) -> some View {
        Button(action: {
            self.counterValue += value
        }) {
            Text(label)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonStart"), Color("ButtonEnd")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    ContentView()
}
