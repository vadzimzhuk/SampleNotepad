//
//  EntriesManagerMock.swift
//  NotepadTests
//
//  Created by Vadim Zhuk on 20/10/2023.
//

import Foundation

@testable import Notepad

class EntriesManagerMock: EntriesProviderService {
    let storageService: StorageService

    init(storageService: StorageService) {
        self.storageService = storageService
    }
    
    func createEntry() -> Notepad.NoteEntity {
        NoteEntity(id: UUID().uuidString, title: "", body: "")
    }

    func save(note: Notepad.NoteEntity) {
        storageService.save(note: note)
    }

    func removeNote(with id: String) {
        storageService.removeNote(with: id)
    }

    func getAllNotes() async -> [Notepad.NoteEntity] {
        await storageService.getAllNotes()
    }
}
