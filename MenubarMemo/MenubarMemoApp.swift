//
//  MenubarMemoApp.swift
//  MenubarMemo
//
//  Created by Naoki Takahashi on 2022/09/03.
//

import SwiftUI

@main
struct MenubarMemoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        Settings { }
    }
}
