//
//  StatsDatabase.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-03.
//

import Foundation
import SwiftUI

struct Stat {
    var date: Date
    var image: Image
    var workout: String
}

var StatsDatabase: [Stat] = []
