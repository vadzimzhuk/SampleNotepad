//
//  EntryFactoryService.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import Foundation

protocol EntriesProviderService {
    func createEntry() -> NoteEntity
    func save(note: NoteEntity)
    func removeNote(with id: String)
    func getAllNotes() async -> [NoteEntity]
}

class EntriesManager: EntriesProviderService {
    var storageService: StorageService

    init(storageService: StorageService) {
        self.storageService = storageService
    }

    func removeNote(with id: String) {
        storageService.removeNote(with: id)
    }

    func getAllNotes() async -> [NoteEntity] {
        await storageService.getAllNotes()
    }

    func createEntry() -> NoteEntity {
        NoteEntity(id: UUID().uuidString, title: "New entry", body: "")
    }

    func createEntryBuilder() -> EntryBuilder {
        EntryBuilder(entryFactory: self, entry: NoteEntity(id: UUID().uuidString, title: "", body: ""))
    }

    func save(note: NoteEntity) {
        storageService.save(note: note)
    }
}
