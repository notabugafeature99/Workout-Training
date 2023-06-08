//
//  CalendarView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-03.
//

import SwiftUI
import CoreData
import UIKit

struct MainView: View {
    var body: some View {
        NavigationView {
            CalendarView()
        }
    }
}

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    @State private var isShowingWorkoutDetails = false
    
    var body: some View {
        VStack {
            DatePicker(
                "Select a Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding()
            
            Button(action: {
                isShowingWorkoutDetails = true
            }) {
                Text("View Workout Details")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingWorkoutDetails) {
                WorkoutDetailsView(date: selectedDate)
            }
        }
        .navigationBarTitle("Workout Calendar")
    }
}

struct WorkoutDetailsView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)])
    var workoutData: FetchedResults<WorkoutData>
    
    let date: Date
    
    init(date: Date) {
        self.date = date
        let predicate = NSPredicate(format: "date >= %@ && date < %@",
                                    argumentArray: [date.startOfDay, date.startOfNextDay])
        _workoutData = FetchRequest(
            sortDescriptors: [SortDescriptor(\.date)],
            predicate: predicate
        )
    }
    
    var workoutDetails: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return "Workout details for \(formatter.string(from: date))"
    }
    
    
    var body: some View {
        
        return VStack {
            Text(workoutDetails)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            List {
                ForEach(workoutData) { workoutData in
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(workoutData.workoutname!)
                                .bold()
                            
                            if let image = workoutData.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                            } else {
                                Text("No image available")
                                    .italic()
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                    }
                }
            }

            
            
            Spacer()
        }
        .navigationBarTitle("Workout Details")
    }
}

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var startOfNextDay: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
