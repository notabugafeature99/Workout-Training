//
//  ViewStats.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-06-02.
//

import SwiftUI

struct ViewStats: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateBack = false
    
    var body: some View {
        VStack {
            CalendarView()
                .padding()
            
            Button("Go Back") {
                presentationMode.wrappedValue.dismiss() // Dismiss the ViewStats view and go back to the previous view
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                NavigationLink(destination: ContentView()) {
            Button(action: {
                    presentationMode.wrappedValue.dismiss()
                ContentView()
                }) {
                    Image(systemName: "arrow.left")
            }
        }
        )
    }
}

struct ViewStats_Previews: PreviewProvider {
    static var previews: some View {
        ViewStats()
    }
}
