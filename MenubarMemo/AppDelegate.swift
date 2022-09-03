//
//  AppDelegate.swift
//  MenubarMemo
//
//  Created by Naoki Takahashi on 2022/09/03.
//

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
        button.image = NSImage(systemSymbolName: "pencil.and.ellipsis.rectangle", accessibilityDescription: nil)
        button.imagePosition = NSControl.ImagePosition.imageLeft
        button.title = "Be Integrity"
        // アクションの設定
        button.action = #selector(menuButtonAction(sender:))
        // 右クリックの設定
        button.sendAction(on: [.leftMouseUp, .rightMouseUp])
    }
    
    @objc func menuButtonAction(sender: AnyObject) {
        guard let event = NSApp.currentEvent else { return }
        if event.type == NSEvent.EventType.rightMouseUp {
            let menu = NSMenu()
            menu.addItem(
                withTitle: NSLocalizedString("Quit", comment: "Quit app"),
                action: #selector(terminate),
                keyEquivalent: ""
            )
            statusBarItem.menu = menu
            statusBarItem.button?.performClick(nil)
            statusBarItem.menu = nil
            return
        }
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
    
    @objc func terminate() {
        NSApp.terminate(self)
    }
}
