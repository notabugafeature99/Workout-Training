//
//  Workout_TrainingApp.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-29.
//

import SwiftUI

@main
struct Workout_TrainingApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
