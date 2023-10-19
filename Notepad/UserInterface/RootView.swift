//
//  ContentView.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

struct RootView: View {
    
    @Environment(\.entryFactory) var entryFactory
    @Environment(\.storageService) var storageService

    @State var notes: [NoteEntity] = []

    var body: some View {
        NavigationView {
            List(notes, id: \.id) { note in
                    NavigationLink {
                        NavigationLazyView(
                            NoteDetailsView(builder: EntryBuilder(entryFactory: entryFactory,
                                                                  entry: note))
                        )
                    } label: {
                        NotePreviewView(title: note.title)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {

                                Button("Delete") {
                                    withAnimation {
                                        storageService.removeNote(with: note.id)
                                    }
                                }
                                .tint(.red)
                            }
                    }
            }
            .listStyle(.plain)
        }
        .onAppear {
            notes = storageService.getAllNotes()
        }
        .onReceive(NotificationCenter.default.publisher(for: .storageUpdated)) { _ in
                notes = storageService.getAllNotes()
        }
    }
}

#Preview {
    RootView()
}
