//
//  MQTTTestAppApp.swift
//  MQTTTestApp
//
//  Created by Kenneth Rosener on 1/27/23.
//

import SwiftUI

@main
struct MQTTTestApp: App {
    var body: some Scene {
        WindowGroup {
            TimestampView(timestampViewModel: TimestampViewModel())
        }
    }
}
