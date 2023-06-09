//
//  ExcerciseInfoView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-31.
//

import SwiftUI

struct ExcerciseInfoView: View {
    let excercise: Excercise
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(excercise.title)
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
}

struct ExcerciseInfoView_Previews: PreviewProvider {
    static var excercise = Excercise.sampleData[2]
    
    static var previews: some View {
        ExcerciseInfoView(excercise: excercise)
    }
}
