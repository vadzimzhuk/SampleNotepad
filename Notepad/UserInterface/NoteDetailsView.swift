//
//  NoteDetailsView.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

struct NoteDetailsView: View {
    @StateObject var builder: EntryBuilder

    @State var editState: Bool = false
    @FocusState var titleTextfieldFocused

    var body: some View {
        VStack(spacing: 10) {
            if editState {
                TextField("Enter title here", text: $builder.entry.title)
                    .focused($titleTextfieldFocused)
            } else {
                Text(builder.entry.title)
            }
            Divider()
            TextField("Note text", text: $builder.entry.body)
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxHeight: .infinity)

        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    builder.save()
                    editState.toggle()
                    titleTextfieldFocused = true
                }, label: {
                    Text(editState ? "Save change" : "Edit title")
                })

                if !editState {
                    Button(action: {
                        builder.save()
                    }, label: {
                        Text("Save")
                    })
                }
            }
        }
    }
}

#Preview {
    NoteDetailsView(builder: EntryBuilder(entryFactory: EntryFactory(storageService: TmpStorage()),
                                          entry: .init(id: "", title: "title", body: "body")))
}
