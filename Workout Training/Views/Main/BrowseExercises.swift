//
//  HomeView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-29.
//

import SwiftUI

struct BrowseExercises: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var excercise: [Excercise]
    @State private var selectedCategory: String = "All"
    
    var filteredExercises: [Excercise] {
        if selectedCategory == "All" {
            return excercise
        } else {
            return excercise.filter { $0.category == selectedCategory }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text("Browse Exercises").font(.title).bold()
                Spacer()
                Spacer()
                Spacer()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .stroke()
                        .fill(.gray)
                    
                    HStack() {
                        Text("Category")
                        Picker(selection: $selectedCategory, label: Text("")) {
                            Text("All").tag("All")
                            ForEach(uniqueCategories(), id: \.self) { category in
                                Text(category).tag(category)
                            }
                        }
                    }
                    .padding()
                }.font(.title3)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(filteredExercises) { excercise in
                        NavigationLink(destination: ExcerciseInfoView(excercise: excercise)) {
                            ExcerciseCardView(excercise: excercise)
                        }
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.largeTitleTextAttributes = [
                    .foregroundColor: colorScheme == .light ? UIColor.black : UIColor.white
                ]
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
    private func uniqueCategories() -> [String] {
        let categories = excercise.map { $0.category }
        return Array(Set(categories))
    }
}

struct HomeView: View {
    @State private var exercises = Excercise.sampleData
    
    var body: some View {
        NavigationView {
            BrowseExercises(excercise: $exercises)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
