//
//  WrapperViews.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {

    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: some View {
        build()
    }
}
