//
//  WorkoutView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-01.
//

import SwiftUI

struct WorkoutView: View {
    let workouts: [Workout]
    var body: some View {
        VStack {
            Text("Workouts").font(.largeTitle).padding(.top)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                ForEach(workouts) { workout in
                    
                    NavigationLink(destination: ViewWorkouts(workout: workout)) {
                        Text(workout.name)
                    }
                    
                    
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var workout = Workout.sampleWorkout
    
    static var previews: some View {
        WorkoutView(workouts: workout)
    }
}
