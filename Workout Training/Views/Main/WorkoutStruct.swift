//
//  WorkoutData.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-31.
//

import Foundation

struct Workout: Identifiable {
    let id: UUID
    var name: String
    var excercise: [Excercise]
    
    
    init(id: UUID = UUID(), name: String, excercise: [Excercise]) {
        self.id = id
        self.name = name
        self.excercise = excercise
    }
}

extension Workout {
    static let sampleWorkout: [Workout] =
    [
        Workout(name: "Chest And Back",
                excercise: [
                    Excercise(title: "Bench press",
                              image: "benchpress",
                              description: "Lie flat on a bench, holding a bar with a shoulder-width grip. Plant your feet on the floor and tense your muscles. Lower the bar until it touches your chest, then press it back up powerfully.",
                              setsandreps: "Sets 4 Reps 10",
                              category: "Chest"),

                    Excercise(title: "Bent-over row",
                              image: "Bent-overrow",
                              description: "Stand tall, holding a barbell with a shoulder-width overhand grip. Bend forwards, hinging from your hips, but keep your chest up and your core braced. Row the bar up to your body, leading with your elbows. Pause at the top, then lower.",
                              setsandreps: "Sets 4 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "Incline dumbbell flye",
                              image: "Inclinedumbbellflye",
                              description: "Lie back on an incline bench, holding two dumbbells directly over your chest with straight arms. Bend your elbows slightly, then lower your hands out to the sides until you feel a stretch across your chest. Squeeze your pecs to return to the start.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Chest"),
                    
                    Excercise(title: "Lat pull-down",
                              image: "Latpull-down",
                              description: "Position yourself at the machine with a shoulder-width overhand grip on the bar. Keeping your chest up and abs braced, pull the bar down, leading with your elbows. Hold the bottom position for a second, then return to the start.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "One-arm cable press",
                              image: "One-armcablepress",
                              description: "Stand tall with your back to a cable machine, holding a D-handle in one hand. Keeping your chest up and core braced, press your hand forwards until your arm is straight. Reverse back to the start and repeat for all the reps, then switch arms.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "Dumbbell pull-over",
                              image: "Dumbbellpull-over",
                              description: "Lie flat on a bench, holding a dumbbell in both hands above your chest with straight arms. Lower the weight behind your head in a slow and controlled movement, keeping your arms straight, then raise it back to the start position.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Chest")]),
        
        Workout(name: "Abs",
                excercise: [
                    Excercise(title: "Crunch",
                              image: "Crunch",
                              description: "Lie flat on your back with your knees bent and hands by your temples or crossed over your chest. Engage your upper abs to raise your torso, then crunch your upper body up towards your knees. Lower slowly, keeping tension on your abs throughout.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Abs"),
                    
                    Excercise(title: "Plank",
                              image: "Plank",
                              description: "Get into position with your elbows under your shoulders, your feet together and your hips raised with abs and glutes engaged so your body forms a straight line from head to heels. Hold this position without letting your hips drop.",
                              setsandreps: "Sets 3 Time 30sec",
                              category: "Abs")]),
        
        Workout(name: "Full Body",
                excercise: [
                    Excercise(title: "Bench press",
                              image: "benchpress",
                              description: "Lie flat on a bench, holding a bar with a shoulder-width grip. Plant your feet on the floor and tense your muscles. Lower the bar until it touches your chest, then press it back up powerfully.",
                              setsandreps: "Sets 4 Reps 10",
                              category: "Chest"),

                    Excercise(title: "Bent-over row",
                              image: "Bent-overrow",
                              description: "Stand tall, holding a barbell with a shoulder-width overhand grip. Bend forwards, hinging from your hips, but keep your chest up and your core braced. Row the bar up to your body, leading with your elbows. Pause at the top, then lower.",
                              setsandreps: "Sets 4 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "Incline dumbbell flye",
                              image: "Inclinedumbbellflye",
                              description: "Lie back on an incline bench, holding two dumbbells directly over your chest with straight arms. Bend your elbows slightly, then lower your hands out to the sides until you feel a stretch across your chest. Squeeze your pecs to return to the start.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Chest"),
                    
                    Excercise(title: "Lat pull-down",
                              image: "Latpull-down",
                              description: "Position yourself at the machine with a shoulder-width overhand grip on the bar. Keeping your chest up and abs braced, pull the bar down, leading with your elbows. Hold the bottom position for a second, then return to the start.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "One-arm cable press",
                              image: "One-armcablepress",
                              description: "Stand tall with your back to a cable machine, holding a D-handle in one hand. Keeping your chest up and core braced, press your hand forwards until your arm is straight. Reverse back to the start and repeat for all the reps, then switch arms.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Back"),
                    
                    Excercise(title: "Dumbbell pull-over",
                              image: "Dumbbellpull-over",
                              description: "Lie flat on a bench, holding a dumbbell in both hands above your chest with straight arms. Lower the weight behind your head in a slow and controlled movement, keeping your arms straight, then raise it back to the start position.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Chest"),
                    
                    Excercise(title: "Crunch",
                              image: "Crunch",
                              description: "Lie flat on your back with your knees bent and hands by your temples or crossed over your chest. Engage your upper abs to raise your torso, then crunch your upper body up towards your knees. Lower slowly, keeping tension on your abs throughout.",
                              setsandreps: "Sets 3 Reps 10",
                              category: "Abs"),
                    
                    Excercise(title: "Plank",
                              image: "Plank",
                              description: "Get into position with your elbows under your shoulders, your feet together and your hips raised with abs and glutes engaged so your body forms a straight line from head to heels. Hold this position without letting your hips drop.",
                              setsandreps: "Sets 3 Time 30sec",
                              category: "Abs")
                ])
    ]
}
