//
//  EnvironmentDIApp.swift
//  EnvironmentDI
//
//  Created by Kotaro Fukuo on 2022/08/25.
//

import SwiftUI

@main
struct EnvironmentDIApp: App {
    var body: some Scene {
        WindowGroup {
            let enviroment = ProcessInfo.processInfo.environment["EVN"]
            if enviroment == "TEST" {
                ContentView().environment(\.service, MockService())
            } else {
                ContentView()
            }
        }
    }
}
