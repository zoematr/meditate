//
//  meditateApp.swift
//  meditate
//
//  Created by Zoe Matrullo on 26/11/22.
//

import SwiftUI

@main
struct meditateApp: App {
    let meditationData = MeditationData()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(meditationData)
        }
    }
}
