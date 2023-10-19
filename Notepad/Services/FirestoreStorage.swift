//
//  FirestoreStorage.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreStorage: StorageService {
    let db = Firestore.firestore()

    private let notesCollectionName: String = "notes"

    init() {
        setupListener()
    }

    func getAllNotes() async -> [NoteEntity] { //make async
        await withCheckedContinuation { continuation in
            db.collection(notesCollectionName).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var output: [NoteEntity] = []
                    for document in querySnapshot!.documents {
                        output.append(NoteEntity(id: document.documentID,
                                                 title: document.data()[NoteEntity.CodingKeys.title.rawValue] as? String ?? "",
                                                 body: document.data()[NoteEntity.CodingKeys.body.rawValue] as? String ?? ""))
                    }

                    continuation.resume(returning: output)
                }
            }
        }
    }

    func save(note: NoteEntity) {
        db.collection(notesCollectionName).document(note.id).setData([
            NoteEntity.CodingKeys.title.rawValue: note.title,
            NoteEntity.CodingKeys.body.rawValue: note.body
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func removeNote(with id: String) {
        db.collection(notesCollectionName).document(id).delete { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }

    func setupListener() {
        db.collection(notesCollectionName)
            .addSnapshotListener { _, _ in
                NotificationCenter.default.post(Notification(name: .storageUpdated))
            }
    }
}
