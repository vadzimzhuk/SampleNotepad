//
//  NotepadApp.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

@main
struct NotepadApp: App {

    @Environment(\.entryFactory) var entryFactory

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
