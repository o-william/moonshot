//
//  ContentView.swift
//  Moonshot
//
//  Created by Oluwapelumi Williams on 14/09/2023.
//

// Challenges: Add the launch date to MissionView below the mission badge. Formatting choice is up to you
// Extract one or two pieces of view code into their own new SwiftUI views - the horizontal scroll view in MissionView is a great candidate.
// You can add a toolbar item to ContentView that toggles between showing missions as a grid as a list

import SwiftUI

struct ContentView: View {
    // @State private var showingGrid: Bool = true
    @State private var showingGrid: Bool = true
    @State private var hideBackButton: Bool = true
    
    var body: some View {
        // I should edit the views to take in the data as arguments instead of having the data processed in two different views
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout()
                        .navigationBarTitle("Moonshot")
                        .navigationBarBackButtonHidden(hideBackButton)
                } else {
                    ListLayout()
                        .navigationBarTitle("Moonshot")
                        .navigationBarBackButtonHidden(hideBackButton)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingGrid.toggle()
                        hideBackButton = true
                    })
                    {
                        if showingGrid {
                            Text("List View")
                                .foregroundColor(.white)
                        } else {
                            Text("Grid View")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//
//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
//
//    @State private var showingGrid: Bool = true
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
//                            // Text("Detail view")
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//                                    .padding()
//
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
//                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.lightBackground)
//                                )
//                        }
//                    }
//                    //.padding([.horizontal, .bottom])
//                }
//                .padding([.horizontal, .bottom])
//            }
//            .navigationTitle("Moonshot")
//            .toolbar {
//                Button("List View") {
//                    // showingGrid = false
//                }
//            }
//            .background(.darkBackground)
//            .preferredColorScheme(.dark)
//
//
//            // Navigation view closing brace is below
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
