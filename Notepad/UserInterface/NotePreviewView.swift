//
//  NotePreview.swift
//  Notepad
//
//  Created by Vadim Zhuk on 18/10/2023.
//

import SwiftUI

struct NotePreviewView: View {
    let title: String

    var body: some View {
        Text(title)
    }
}

#Preview {
    NotePreviewView(title: "Sample title")
}
