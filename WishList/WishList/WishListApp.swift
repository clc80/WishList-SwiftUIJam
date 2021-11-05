//
//  WishListApp.swift
//  WishList
//
//  Created by Claudia Maciel on 11/5/21.
//

import SwiftUI

@main
struct WishListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
