//
//  DataController.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-04.
//

import Foundation
import CoreData
import UIKit

class DataController: ObservableObject {
    // Responsible for preparing a model
    let container = NSPersistentContainer(name: "WorkoutDataEntity")

    
    init() {
        
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully. WUHU!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addWorkout(name: String, image: UIImage, context: NSManagedObjectContext) {
        let workoutData = WorkoutData(context: context)
        workoutData.id = UUID()
        workoutData.date = Date()
        
        workoutData.workoutname = name
        
        workoutData.image = image
        
        save(context: context)
    }
    
    func addWorkoutNoImage(name: String, context: NSManagedObjectContext) {
        let workoutData = WorkoutData(context: context)
        workoutData.id = UUID()
        workoutData.date = Date()
        
        workoutData.workoutname = name
        
        save(context: context)
    }
    
    func addWeightData(weightLoad: Int16, date: Date, context: NSManagedObjectContext) {
        let weightData = WeightData(context: context)
        weightData.id = UUID()
        weightData.weightLoad = weightLoad
        weightData.date = date
        
        save(context: context)
    }
    
}
