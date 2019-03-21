//
//  ScreenCapture.swift
//  glorious-osx
//
//  Created by Oliver Schneider on 21.03.19.
//  Copyright © 2019 Oliver Schneider. All rights reserved.
//

import Foundation

class ScreenCapture {
    
    private var tempDir: String!
    
    init() {
        self.tempDir = NSTemporaryDirectory()
    }
    
    func captureScreen() {
        let task = Process()
        
        let filename = "shot.png"
        let destination = self.tempDir + filename
        
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-i", "-r", destination]
        task.launch()
        task.waitUntilExit()
        
        print("Saved at: " + destination)
        
        let open = Process()
        open.launchPath = "/usr/bin/open"
        open.arguments = [destination]
        open.launch()
        open.waitUntilExit()
    }
}
