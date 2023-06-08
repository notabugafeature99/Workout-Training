//
//  ExcerciseCardView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-31.
//

import SwiftUI

struct ExcerciseCardView: View {
    @Environment(\.colorScheme) var colorScheme
    let excercise: Excercise
    var body: some View {
        VStack {
            Text(excercise.title)
            Text(excercise.category)
            Image(excercise.image).resizable().aspectRatio(contentMode: .fit)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
            .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 2))
    }
}

struct ExcerciseCardView_Previews: PreviewProvider {
    static var excercise = Excercise.sampleData[2]
    static var previews: some View {
        ExcerciseCardView(excercise: excercise)
    }
}
