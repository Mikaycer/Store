//
//  StoreAppApp.swift
//  StoreApp
//

import SwiftUI

@main
struct StoreAppApp: App {
    var body: some Scene {
        let login = LoginViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
