//
//  CompteurVisionApp.swift
//  CompteurVision
//
//  Created by Lukas Mauffré on 07/03/2024.
//

import SwiftUI

@main
struct CompteurVisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
