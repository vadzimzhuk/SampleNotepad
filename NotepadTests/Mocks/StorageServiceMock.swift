//
//  StorageServiceMock.swift
//  NotepadUnitTests
//
//  Created by Vadim Zhuk on 20/10/2023.
//

import Foundation

@testable import Notepad

class StorageServiceMock: StorageService {
    var notes: [NoteEntity] = []

    func getAllNotes() async -> [Notepad.NoteEntity] {
        notes
    }
    
    func save(note: Notepad.NoteEntity) {
        notes.append(note)
    }
    
    func removeNote(with id: String) {
        notes.removeAll { id == $0.id }
    }
}
