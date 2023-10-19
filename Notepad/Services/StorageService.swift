//
//  StorageService.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import Foundation

protocol StorageService {
    func getAllNotes() async -> [NoteEntity]
    func save(note: NoteEntity)
    func removeNote(with id: String)
}
