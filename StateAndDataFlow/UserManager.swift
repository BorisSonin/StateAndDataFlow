//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegistered = StorageManager.shared.fetchDataBool()
    var name = StorageManager.shared.fetchDataName()
}

