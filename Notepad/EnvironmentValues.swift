//
//  EnvironmentValues.swift
//  Notepad
//
//  Created by Vadim Zhuk on 19/10/2023.
//

import SwiftUI

//    Storage service
struct StorageObjectKey: EnvironmentKey {
    static let defaultValue: StorageService = DIContainer.shared.resolve(StorageService.self)!
}

//     Entry factory
struct EntryFactoryObjectKey: EnvironmentKey {
    static let defaultValue: EntryFactoryService = DIContainer.shared.resolve(EntryFactoryService.self)!
}

// MARK: - EnvironmentValues
extension EnvironmentValues {
    // Storage service
    var storageService: StorageService {
        self[StorageObjectKey.self]
    }

    // Entry factory
    var entryFactory: EntryFactoryService {
        get { self[EntryFactoryObjectKey.self] }
        set { self[EntryFactoryObjectKey.self] = newValue }
    }
}
