//
//  nextech_today_v1App.swift
//  nextech_today_v1
//
//  Created by Dr. Alex Mitre on 21/07/25.
//

import SwiftUI

@main
struct nextech_today_v1App: App {
    @State private var showWelcome = true
    
    var body: some Scene {
        WindowGroup {
            if showWelcome {
                WelcomeView(showWelcome: $showWelcome)
            } else {
                ContentView()
            }
        }
    }
}
