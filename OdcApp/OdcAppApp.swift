//
//  OdcAppApp.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 30/06/2026.
//

import SwiftUI

@main
struct OdcAppApp: App {
    @StateObject private var auth = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if auth.estConnecte {
                FormationsListView()
            } else {
                AccueilView()
            }
        }
        .environmentObject(auth)
    }
}
