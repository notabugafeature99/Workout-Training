//
//  ExcerciseInfoView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-31.
//

import SwiftUI

struct WorkoutExcerciseInfoView: View {
    let workout: Workout
    @State private var currentExcerciseIndex = 0
    @State private var isWorkoutComplete = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack() {
                    if currentExcerciseIndex < workout.excercise.count {
                        let excercise = workout.excercise[currentExcerciseIndex]
                    
                        HStack {
                            Text(excercise.title)
                                .bold()
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Spacer()
                            
                        }
                        .navigationBarItems(trailing:
                                                Group {
                            if currentExcerciseIndex + 1 == workout.excercise.count {
                                NavigationLink(destination: EndWorkoutView(workout:workout), isActive: $isWorkoutComplete) {
                                    Button(action: {
                                        isWorkoutComplete = true
                                    }) {
                                        Text("Done").foregroundColor(.blue)
                                    }
                                    .foregroundColor(.blue)}
                                
                            } else {
                                Button(action: {
                                    currentExcerciseIndex = (currentExcerciseIndex + 1) % workout.excercise.count
                                }) {
                                    HStack {
                                        Text("Next")
                                        Text(Image(systemName: "chevron.right"))
                                            .fontWeight(.medium)
                                    }
                                }
                                .foregroundColor(.blue)
                            }
                        }
                            .padding()
                        )
                        
                        
                        Text(excercise.category)
                            .padding()
                        
                        Text(excercise.setsandreps)
                            .padding()
                        
                        Image(excercise.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Text(excercise.description)
                            .padding()
                    }
                    
                }
            }
            Divider()
            ProgressView(value: Double(1 + currentExcerciseIndex) / Double(workout.excercise.count))
                .padding()
            
        }
    }
}

struct WorkoutExcerciseInfoView_Previews: PreviewProvider {
    static var workout = Workout.sampleWorkout[1]
    
    static var previews: some View {
        WorkoutExcerciseInfoView(workout: workout)
    }
}
