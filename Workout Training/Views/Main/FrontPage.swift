//
//  ContentView.swift
//  Workout Training
//
//  Created by Tommaso Castellanza on 2023-05-29.
//

import SwiftUI
import AVKit

struct PlayerViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let viewController = AVPlayerViewController()
        viewController.player = player
        viewController.showsPlaybackControls = false
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // No update needed
    }
}

struct ContentView: View {
    let player: AVPlayer
    
    init() {
        let videoURL = Bundle.main.url(forResource: "backgroundvideo", withExtension: "mp4")!
        player = AVPlayer(url: videoURL)
        player.actionAtItemEnd = .none
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 35),
            .baselineOffset: -10// Customize the font size here
        ]
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    
                    PlayerViewController(player: player)
                        .ignoresSafeArea()
                        .onAppear {
                            player.play()
                        }
                        .onTapGesture {
                            // Add any desired action when tapping on the video player
                        }

                    VStack(alignment: .center, spacing: 20.0) {
                        
                        NavigationLink(destination: WorkoutView(workouts: Workout.sampleWorkout)) {
                            Text("View Workouts")
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: BrowseExercises(excercise: .constant(Excercise.sampleData))) {
                            Text("Browse Exercises")
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: ViewStats()) {
                            Text("View Stats")
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .frame(width: 330.0, height: 200.0)
                    .scaledToFit().bold()
                    
                    
                }
                .navigationTitle("Workout Training").font(.title).navigationBarTitleDisplayMode(.inline) // Set the font size to .title
                .foregroundColor(.white) // Add the title here
            }
        }
        .onDisappear {
            player.pause()
        }
        .onReceive(NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)) { _ in
            player.seek(to: .zero)
            player.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
