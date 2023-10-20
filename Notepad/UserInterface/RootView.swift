//
//  ContentView.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

struct RootView: View {
    enum Strings {
        static var appTitle: String = "Sample notepad app"
        static var deleteButtonTitle: String = "Delete"
        static var emptyNotesMessage: String = "Empty notepad"
    }

    enum Images {
        static var newNoteButtonImage: Image = Image(systemName: "plus")
    }

    @Environment(\.entriesManager) var entriesManager

    @State var notes: [NoteEntity] = []
    @State var showNewEntry: Bool = false

    private var textTapGesture: some Gesture {
        TapGesture(count: 1)
            .onEnded {
                showNewEntry = true
            }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                if notes.isEmpty {
                    VStack {
                        Spacer()
                        Text(Strings.emptyNotesMessage)
                        Spacer()
                    }
                }

                VStack {
                    Text(Strings.appTitle.capitalized)
                        .font(.largeTitle)

                    List(notes, id: \.id) { note in
                        NavigationLink {
                            NavigationLazyView(
                                NoteDetailsView(builder: EntryBuilder(entryFactory: entriesManager,
                                                                      entry: note))
                            )
                        } label: {
                            NotePreviewView(title: note.title)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {

                                    Button(Strings.deleteButtonTitle) {
                                        withAnimation {
                                            entriesManager.removeNote(with: note.id)
                                        }
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                    .listStyle(.plain)
                }

                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()

                        ZStack {
                            Circle()
                                .fill(Color.pink)
                                .frame(width: 50, height: 50)
                            Text("\(Images.newNoteButtonImage)")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .gesture(textTapGesture)

                        Spacer()
                            .frame(width: 15)
                    }
                }
                .padding(.vertical, 10)
            }
            .navigationDestination(isPresented: $showNewEntry) {
                NavigationLazyView(
                    NoteDetailsView(builder: EntryBuilder(entryFactory: entriesManager, entry: entriesManager.createEntry()))
                )
            }
        }
        .onAppear {
            Task {
                notes = await entriesManager.getAllNotes()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .storageUpdated)) { _ in
            Task {
                notes = await entriesManager.getAllNotes()
            }
        }
    }
}

#Preview {
    RootView()
}
