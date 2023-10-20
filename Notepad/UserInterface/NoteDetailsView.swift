//
//  NoteDetailsView.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

struct NoteDetailsView: View {

    enum Strings {
        static var titlePlaceholder: String = "Enter title here"
        static var saveButtonTitle: String = "Save"
    }
    
    @StateObject var builder: EntryBuilder

    @State var editState: Bool = false

    @FocusState var titleTextfieldFocused
    @FocusState var bodyTextfieldFocused

    private var textTapGesture: some Gesture {
        TapGesture(count: 1)
            .onEnded {
                editState = true
                titleTextfieldFocused = true
            }
    }

    var body: some View {
        VStack(spacing: 10) {
            if editState {
                TextField(Strings.titlePlaceholder, text: $builder.entry.title)
                    .focused($titleTextfieldFocused)
                    .onSubmit {
                        editState = false
                        builder.save()
                    }
                    .submitLabel(.done)
            } else {
                Text(builder.entry.title)
                    .gesture(textTapGesture)
            }
            Divider()

            CustomTextView(text: $builder.entry.body)
                .focused($bodyTextfieldFocused)
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .padding()

        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    builder.save()
                    editState = false
                    bodyTextfieldFocused = false
                    titleTextfieldFocused = false
                }, label: {
                    Text(Strings.saveButtonTitle)
                })
            }
        }
    }
}

#Preview {
    NoteDetailsView(builder: EntryBuilder(entryFactory: EntriesManager(storageService: FirestoreStorage()),
                                          entry: .init(id: "", title: "title", body: "body")))
}
