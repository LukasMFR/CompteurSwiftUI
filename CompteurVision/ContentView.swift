//
//  ContentView.swift
//  CompteurVision
//
//  Created by Lukas Mauffré on 07/03/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State private var counterValue: Int = 0
    @State private var hovered: Int? = nil // Keeps track of which button is hovered
    
    var body: some View {
        
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color("StartGradient"), Color("EndGradient")]), startPoint: .leading, endPoint: .trailing)
//                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Make the counter text larger and change the color to black
                Text("\(counterValue)")
                    .font(.system(size: 150, weight: .bold)) // Increased font size
                    .foregroundColor(.white) // Changed color to black
                
                HStack(spacing: 10) {
                    modifierButton(label: "-10", value: -10)
                    modifierButton(label: "-5", value: -5)
                    modifierButton(label: "-1", value: -1)
                    modifierButton(label: "+1", value: 1)
                    modifierButton(label: "+5", value: 5)
                    modifierButton(label: "+10", value: 10)
                }
                
                Button(action: {
                    self.counterValue = 0
                }) {
                    Text("Remettre le compteur à zéro")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ResetStart"), Color("ResetEnd")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                        .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 2)
                        .scaleEffect(hovered == 0 ? 1.05 : 1.0)
                }
                .buttonStyle(PlainButtonStyle()) // Apply the plain button style to remove any default styling
                .onHover { isHovering in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        self.hovered = isHovering ? 0 : nil
                    }
                }
            }
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
    
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
                .shadow(color: .gray.opacity(hovered == value ? 0.5 : 0.4), radius: hovered == value ? 6 : 4, x: 0, y: hovered == value ? 4 : 2)
                .scaleEffect(hovered == value ? 1.05 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { isHovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                self.hovered = isHovering ? value : nil
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
