//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = StorageManager.shared.fetchDataName()
    @EnvironmentObject private var userManger: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                
                Text("\(name.count)")
                    .foregroundColor(name.count >= 3 ? .green : .red)
            }
            .padding()
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(name.count >= 3 ? false : true)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty, name.count > 2 {
            userManger.name = name
            userManger.isRegistered.toggle()
            StorageManager.shared.save(bool: userManger.isRegistered)
            StorageManager.shared.save(name: userManger.name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
