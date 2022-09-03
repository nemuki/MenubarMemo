//
//  AppDelegate.swift
//  MenubarMemo
//
//  Created by Naoki Takahashi on 2022/09/03.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        guard let button = self.statusBarItem.button else { return }
        // アイコンの設定
        button.image = NSImage(systemSymbolName: "camera.macro", accessibilityDescription: nil)
        // アクションの設定
        button.action = #selector(menuButtonAction(sender:))
    }
    
    @objc func menuButtonAction(sender: AnyObject) {
        guard let button = self.statusBarItem.button else { return }
        if self.popover.isShown {
            self.popover.performClose(sender)
        } else {
            // ポップアップを表示
            self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            // 他の位置をタップすると消える
            self.popover.contentViewController?.view.window?.makeKey()
        }
    }
}
