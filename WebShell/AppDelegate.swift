//
//  AppDelegate.swift
//  WebShell
//
//  Created by Randy on 15/12/19.
//  Copyright © 2015 RandyLu. All rights reserved.
//
//  Wesley de Groot 21-DEC-2015, Added Notification and console.log Support

import Cocoa
import Foundation
import NotificationCenter

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {
    
    var mainWindow: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Add Notification center to the app delegate.
        NSUserNotificationCenter.defaultUserNotificationCenter().delegate = self
        mainWindow = NSApplication.sharedApplication().windows[0]
    }
    
    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if(!flag){
            mainWindow!.makeKeyAndOrderFront(self)
        }
        // clear badge
        NSApplication.sharedApplication().dockTile.badgeLabel = ""
        NSNotificationCenter.defaultCenter().postNotificationName("clearNotificationCount", object: nil)
        return true
    }

    func userNotificationCenter(center: NSUserNotificationCenter, shouldPresentNotification notification: NSUserNotification) -> Bool {
        // We (i) want Notifications support
        return true
    }
    
    @IBAction func goHome(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("goHome", object: nil)
    }
    @IBAction func reload(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
    }
    @IBAction func copyUrl(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("copyUrl", object: nil)
    }
}

