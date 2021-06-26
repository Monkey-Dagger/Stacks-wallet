//
//  FamwaltApp.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import SwiftUI

@main
struct FamwaltApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
