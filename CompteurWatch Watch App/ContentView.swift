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
            // Adjusted for smaller watch screen
            Text("\(counterValue)")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)

            // Simplified interface for watch
            HStack(spacing: 10) {
                Button(action: {
                    self.counterValue -= 1
                }) {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                
                Button(action: {
                    self.counterValue += 1
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }

            Button(action: {
                self.counterValue = 0
            }) {
                Text("Reset")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(5)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
