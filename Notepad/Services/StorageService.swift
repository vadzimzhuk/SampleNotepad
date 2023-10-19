//
//  StorageService.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import Foundation

protocol StorageService {
    func getAllNotes() -> [NoteEntity]
    func save(note: NoteEntity)
    func removeNote(with id: String)
}

class TmpStorage: StorageService {
    private var allNotes: [NoteEntity] = {
        TmpStorage.testNotes
    }()

    func getAllNotes() -> [NoteEntity] {
        allNotes
    }
    
    func save(note: NoteEntity) {
        if let index = (allNotes.firstIndex{ existingNote in
            existingNote.id == note.id
        }) {
            allNotes[index] = note


            NotificationCenter.default.post(Notification(name: .storageUpdated))
        }
    }

    func removeNote(with id: String) {
        allNotes.removeAll { note in
            note.id == id
        }
        NotificationCenter.default.post(Notification(name: .storageUpdated))
    }
}


extension TmpStorage {
    static let testNotes: [NoteEntity] = {
        (0...10).map {NoteEntity(id: UUID().uuidString, title: "Title \($0)", body: "")}
    }()
}
