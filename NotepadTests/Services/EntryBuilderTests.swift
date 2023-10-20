//
//  NotepadTests.swift
//  NotepadTests
//
//  Created by Vadim Zhuk on 20/10/2023.
//

import XCTest

@testable import Notepad

final class EntryBuilderTests: XCTestCase {
    var storageService: StorageService?
    var entriesManager: EntriesProviderService?
    var sut: EntryBuilder?

    let note = NoteEntity(id: UUID().uuidString, title: "", body: "")

    override func setUpWithError() throws {
        let storageService = StorageServiceMock()
        let entriesManager = EntriesManagerMock(storageService: storageService)
        self.entriesManager = entriesManager
        sut = EntryBuilder(entryFactory: entriesManager, entry: note)
    }

    override func tearDownWithError() throws {}

    func testSaveNote() async throws {
        sut?.save()
        let notes = await entriesManager?.getAllNotes()

        XCTAssertTrue(notes?.contains { $0.id == note.id } ?? false)
    }
}
