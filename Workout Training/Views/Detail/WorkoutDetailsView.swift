//
//  WorkoutDetailsView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-03.
//

import SwiftUI

struct WorkoutDetailsView: View {
    let date: Date
    
    // Replace with your actual workout details and selfie logic
    var workoutDetails: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return "Workout details for \(formatter.string(from: date))"
    }
    
    var selfieImage: UIImage? {
        // Replace with your logic to retrieve selfie image for the selected date
        return UIImage(named: "sample_selfie")
    }
    
    var body: some View {
        VStack {
            Text(workoutDetails)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            if let selfieImage = selfieImage {
                Image(uiImage: selfieImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            }
            
            Spacer()
        }
        .navigationBarTitle("Workout Details")
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(date: Date())
    }
}

