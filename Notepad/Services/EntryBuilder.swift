//
//  EntryBuilder.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import SwiftUI

class EntryBuilder: ObservableObject {
    @Published var entry: NoteEntity

    private var entryFactory: EntriesProviderService

    init(entryFactory: EntriesProviderService,
        entry: NoteEntity) {
        self.entryFactory = entryFactory
        self.entry = entry
    }

    func save() {
        entryFactory.save(note: entry)
    }
}
