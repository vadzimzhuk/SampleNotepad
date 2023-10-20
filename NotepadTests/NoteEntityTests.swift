//
//  NoteEntityTests.swift
//  NotepadTests
//
//  Created by Vadim Zhuk on 20/10/2023.
//

import XCTest

@testable import Notepad

final class NoteEntityTests: XCTestCase {

    var note: NoteEntity?

    override func setUpWithError() throws {
        note = NoteEntity(id: "id", title: "title", body: "body")
    }

    override func tearDownWithError() throws {
        note = nil
    }

    func testContent() throws {
        XCTAssertTrue(note?.id == "id")
        XCTAssertTrue(note?.title == "title")
        XCTAssertTrue(note?.body == "body")
    }

    func testUpdateContent() throws {
        let newNote = NoteEntity(id: "id2", title: "title2", body: "body2")
        note?.update(with: newNote)

        XCTAssertTrue(note?.id == "id")
        XCTAssertTrue(note?.title == "title2")
        XCTAssertTrue(note?.body == "body2")
    }
}
