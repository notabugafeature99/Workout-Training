//
//  ViewWorkouts.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-31.
//

import SwiftUI

struct ViewWorkouts: View {
    @Environment(\.colorScheme) var colorScheme
    let workout: Workout
    @State private var navigateToExcerciseInfo = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text(workout.name)
                    .font(.largeTitle)
                    .padding()
                
                
                NavigationLink(destination: WorkoutExcerciseInfoView(workout: workout), isActive: $navigateToExcerciseInfo) {
                    EmptyView()
                }
                
                Button(action: {
                    navigateToExcerciseInfo = true
                }) {
                    Text("Start")
                        .font(.title2)
                        .padding()
                        
                        .foregroundColor(.white)
                        .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(150)
                }
                
                Text("Exercise count: \(workout.excercise.count)")
                    .font(.title2)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    
                    ForEach(workout.excercise) { excercise in
                        NavigationLink(destination: ExcerciseInfoView(excercise: excercise)) {
                            ExcerciseCardView(excercise: excercise)
                        }
                        
                    }.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }.padding()
            }
        }
    }
}

struct ViewWorkouts_Previews: PreviewProvider {
    static var workout = Workout.sampleWorkout[2]
    
    static var previews: some View {
        ViewWorkouts(workout: workout)
    }
}
