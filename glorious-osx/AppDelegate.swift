//
//  AppDelegate.swift
//  glorious-osx
//
//  Created by Oliver Schneider on 21.03.19.
//  Copyright © 2019 Oliver Schneider. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let screenCapture: ScreenCapture = ScreenCapture()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusBar.button {
            let cloudImage = NSImage(named: NSImage.Name("StatusBarIcon"))
            button.image = cloudImage
        }
        self.createMenu()
    }
    
    func createMenu() {
        let menu = NSMenu()
        
        let screenCaptureItem = NSMenuItem(title: "Capture Screen", action: #selector(self.capture), keyEquivalent: "s")
        menu.addItem(screenCaptureItem)
        
        statusBar.menu = menu
    }
    
    @objc func capture() {
        screenCapture.captureScreen()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

