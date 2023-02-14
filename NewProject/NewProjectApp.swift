//
//  NewProjectApp.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

@main
struct NewProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            SidebarCommands()
        }
    }
}
