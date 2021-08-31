//
//  LineLoginDemoApp.swift
//  LineLoginDemo
//
//  Created by Thongchai Subsaidee on 31/8/2564 BE.
//

import SwiftUI
import LineSDK

@main
struct LineLoginDemoApp: App {
    
    let chanelID = "1656372191"
    
    init() {
        LoginManager.shared.setup(channelID: chanelID, universalLinkURL: nil)
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    _ = LoginManager.shared.application(.shared, open: url)
                })
        }
    }
}
