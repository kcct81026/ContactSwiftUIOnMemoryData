//
//  ContactSwiftUIApp.swift
//  ContactSwiftUI
//
//  Created by KC on 14/07/2022.
//

import SwiftUI

@main
struct ContactSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
