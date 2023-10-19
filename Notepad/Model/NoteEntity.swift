//
//  NoteEntity.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import Foundation

struct NoteEntity {
    var id: String
    var title: String
    var body: String
}

extension NoteEntity: Hashable {}
extension NoteEntity {
    mutating func update(with note: NoteEntity) {
        self.title = note.title
        self.body = note.body
    }
}

extension NoteEntity {
    enum CodingKeys: String {
        case title
        case body
    }
}
