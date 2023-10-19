//
//  EnvironmentValues.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import SwiftUI

struct EntryFactoryObjectKey: EnvironmentKey {
    static let defaultValue: EntriesProviderService = DIContainer.shared.resolve(EntriesProviderService.self)!
}

// MARK: - EnvironmentValues
extension EnvironmentValues {
    var entriesManager: EntriesProviderService {
        get { self[EntryFactoryObjectKey.self] }
        set { self[EntryFactoryObjectKey.self] = newValue }
    }
}
