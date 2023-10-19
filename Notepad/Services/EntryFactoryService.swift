//
//  EntryFactoryService.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import Foundation

protocol EntryFactoryService {
    func createNote() -> NoteEntity
    func save(note: NoteEntity)
}

class EntryFactory: EntryFactoryService {    
    var storageService: StorageService

    init(storageService: StorageService) {
        self.storageService = storageService
    }

    func createNote() -> NoteEntity {
            // TODO: - implement
        NoteEntity(id: "", title: "", body: "")
    }

    func save(note: NoteEntity) {
        storageService.save(note: note)
    }
}
