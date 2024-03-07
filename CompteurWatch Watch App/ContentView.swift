//
//  ContentView.swift
//  CompteurWatch Watch App
//
//  Created by Lukas Mauffré on 07/03/2024.
//

import SwiftUI

// Define a custom button style that applies a gradient background
struct GradientButtonStyle: ButtonStyle {
    var startColor: Color
    var endColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView: View {
    @State private var counterValue: Int = 0
    
    var body: some View {
        ZStack {
            // Apply the gradient to the background
            LinearGradient(gradient: Gradient(colors: [Color("StartGradient"), Color("EndGradient")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                Text("\(counterValue)")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white) // Ensure text color is visible on gradient
                
                HStack(spacing: 10) {
                    Button(action: {
                        self.counterValue -= 1
                    }) {
                        Image(systemName: "minus")
                    }
                    .buttonStyle(GradientButtonStyle(startColor: Color("ButtonStart"), endColor: Color("ButtonEnd")))
                    
                    Button(action: {
                        self.counterValue += 1
                    }) {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(GradientButtonStyle(startColor: Color("ButtonStart"), endColor: Color("ButtonEnd")))
                }
                
                Button(action: {
                    self.counterValue = 0
                }) {
                    Text("Reset")
                        .bold()
                }
                .buttonStyle(GradientButtonStyle(startColor: Color("ResetStart"), endColor: Color("ResetEnd")))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
