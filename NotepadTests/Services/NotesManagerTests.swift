//
//  NotesManagerTests.swift
//  EntryBuilderTests
//
//  Created by Vadim Zhuk on 20/10/2023.
//

import XCTest

@testable import Notepad

final class NotesManagerTests: XCTestCase {
    var storageMock: StorageServiceMock?
    var sut: EntriesManager?

    override func setUpWithError() throws {
        let storageMock = StorageServiceMock()
        self.storageMock = storageMock
        sut = EntriesManager(storageService: storageMock)
    }

    override func tearDownWithError() throws {}

    func testSaveNote() throws {
        let note = NoteEntity(id: UUID().uuidString, title: "Title 1", body: "Sample body")

        sut?.save(note: note)

        XCTAssert(storageMock?.notes.contains { $0.id == note.id } ?? false )
    }

    func testDeleteNote() throws {
        let note = NoteEntity(id: UUID().uuidString, title: "Title 1", body: "Sample body")
        sut?.save(note: note)

        XCTAssertTrue(storageMock?.notes.contains { $0.id == note.id } ?? false )

        sut?.removeNote(with: note.id)

        XCTAssertFalse(storageMock?.notes.contains { $0.id == note.id } ?? false )
    }

    func testSaveNotes() async throws {
        let notes = (0...10).map { NoteEntity(id: UUID().uuidString, title: "Title\($0)", body: "Sample body")}

        notes.forEach { note in
            sut?.save(note: note)
        }

        let numberOfNotesInStorage = await sut?.getAllNotes().count

        XCTAssertTrue(numberOfNotesInStorage == 11)
    }
}
