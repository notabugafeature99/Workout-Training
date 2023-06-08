//
//  WorkoutData+CoreDataProperties.swift
//
//
//  Created by Tommaso Castellanza on 2023-06-06.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit


@objc(WorkoutData)
class WorkoutData: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutData> {
        return NSFetchRequest<WorkoutData>(entityName: "WorkoutData")
    }


    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var image: UIImage?
    @NSManaged public var workoutname: String?

}

extension WorkoutData : Identifiable {

}
