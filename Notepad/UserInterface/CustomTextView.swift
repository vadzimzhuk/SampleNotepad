//
//  CustomTextView.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import SwiftUI

struct CustomTextView: UIViewRepresentable {
    @Binding var text: String

    var baseFontSize: CGFloat = 15.0

    func makeUIView(context: Context) -> UITextView {
        let coordinator = context.coordinator

        let textView = UITextView()
        textView.allowsEditingTextAttributes = true
        textView.delegate = coordinator
        textView.font = UIFont.systemFont(ofSize: baseFontSize)

        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
        textView.adjustsFontForContentSizeCategory = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
}

extension CustomTextView {

    class Coordinator: NSObject, UITextViewDelegate {
        var textContentStorage: NSTextContentStorage?
        var text: Binding<String>

        init(text: Binding<String>) {
            self.text = text

            super.init()
        }


        func textViewDidChange(_ textView: UITextView) {
            text.wrappedValue = textView.text
        }

        func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            return true
        }
    }
}

struct ImageTextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomTextView(text: .constant("nw_connection_copy_connected_remote_endpoint_block_invoke [C7] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection"))
        }
    }
}


