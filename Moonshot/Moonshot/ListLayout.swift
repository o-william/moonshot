//
//  ListLayout.swift
//  Moonshot
//
//  Created by Oluwapelumi Williams on 14/09/2023.
//

import SwiftUI

struct ListLayout: View {
    @Binding var showingGrid: Bool
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                HStack {
                                    VStack(spacing: 10) {
                                        Text(mission.displayName)
                                            .font(.title).fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("Launch date: \(mission.formattedLaunchDate)")
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 7)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button("Grid View") {
                    showingGrid = true
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            
            // Navigation View closing brace below
        }
    }
}

struct ListLayout_Previews: PreviewProvider {
    @State static var showingGrid: Bool = true
    
    static var previews: some View {
        ListLayout(showingGrid: $showingGrid)
    }
}
