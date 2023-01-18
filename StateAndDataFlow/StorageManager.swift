//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Борис Сонин on 18.01.2023.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "Key"
    private let boolKey = "boolKey"
    
    private init () {}
    
    func save(name: String) {
        userDefaults.set(name, forKey: key)
    }
    
    func save(bool: Bool) {
        userDefaults.set(bool, forKey: boolKey)
    }
    
    func fetchDataName() -> String {
        guard let name = userDefaults.value(forKey: key) as? String else { return ""}
        return name
    }
    
    func fetchDataBool() -> Bool {
        guard let bool = userDefaults.value(forKey: boolKey) as? Bool else { return false }
        return bool
    }
    
    func deleteName() {
        userDefaults.removeObject(forKey: key)
    }
    
    func resetBool() {
        userDefaults.removeObject(forKey: boolKey)
    }
    
}
