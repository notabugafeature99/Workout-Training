//
//  EndWorkoutView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-02.
//

import SwiftUI
import CoreData


struct EndWorkoutView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @State private var isShowingCamera = false
    @State private var image: UIImage?
    @State private var isNavigationActive = false
    let workout: Workout
    
    var quotes: [String] = ["You crushed it! High five for that gym hive!",
                            "Sweat today, shine tomorrow!",
                            "Great job! You just leveled up!",
                            "You're a workout warrior. Keep slaying those weights!",
                            "Gym session complete! Time to flex and impress.",
                            "Work out complete. Now you can conquer the world!",
                            "You're a fitness machine. Don't forget to oil those muscles!",
                            "You nailed it! Sweating like a champion.",
                            "You lifted, you conquered. Now it's time to rest and recover.",
                            "Who needs a superhero when you've got a gym buddy like you?",
                            "You're like a gym unicorn. Rare, majestic, and totally awesome!",
                            "Your sweat is your victory song. Keep dancing!",
                            "In the gym, you're a superhero with a secret identity. Your strength is your superpower!",
                            "You're officially a gym Jedi. May the gains be with you!",
                            "Great workout! Your muscles are screaming, 'Thank you!'",
                            "You're a fitness inspiration. Keep inspiring others with your dedication.",
                            "Congratulations! You've got more gains than a bank account.",
                            "No pain, no gain. You nailed it!",
                            "Gym time is your happy hour. Cheers to your hard work!",
                            "You just completed a workout masterpiece. Time to sign it with your sweat!",
                            "You're a fitness force to be reckoned with. Keep shining!",
                            "You slayed that workout like a beast. Rawr!",
                            "Gym buddies like you make the pain worth it!",
                            "You're proof that superheroes do exist. Fitness is your superpower!",
                            "Your workout was fire! Now go cool down and celebrate.",
                            "You just crushed those weights. Hulk would be proud!",
                            "Every workout brings you closer to your fitness goals. Keep going!",
                            "Your dedication is inspiring. You make sweating look stylish!",
                            "You've got the heart of a lion and the determination of a cheetah. Keep chasing those fitness goals!",
                            "You're a workout wizard, turning sweat into strength!",
                            "Your commitment is paying off. Keep going, superstar!"]
    var body: some View {
        VStack{
            let calendar = Calendar.current
            let day = calendar.component(.day, from: Date())
            
            
            Text(quotes[day - 1])
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Take a selfie to remember this day!")
            
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                
                Button("Take Selfie") {
                    isShowingCamera = true
                }.buttonStyle(.bordered)
                    .sheet(isPresented: $isShowingCamera) {
                        CameraView(image: $image).padding()
                    }
            }.padding()
            
                .navigationBarItems(trailing:
                                        NavigationLink(destination: ViewStats(), isActive: $isNavigationActive) {
                    Button("Done") {
                        if let image = image {
                            DataController().addWorkout(
                                name: workout.name,
                                image: image,
                                context: managedObjContext
                            )
                        } else {
                            // Handle the case when the image is nil.
                            // You can display an error message or handle it as per your needs.
                            DataController().addWorkoutNoImage(name: workout.name, context: managedObjContext)
                            
                            print("Image is nil")
                        }
                        isNavigationActive = true
                    }
                    .padding()
                }
                )
            
        }.padding()
        
        
    }
    
    public func removeTimeStamp(fromDate: Date) -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: fromDate)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
}

struct EndWorkoutView_Previews: PreviewProvider {
    static var workout = Workout.sampleWorkout[1]
    static var previews: some View {
        EndWorkoutView(workout: workout)
    }
}
