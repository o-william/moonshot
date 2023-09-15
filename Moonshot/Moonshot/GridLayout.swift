//
//  GridLayout.swift
//  Moonshot
//
//  Created by Oluwapelumi Williams on 14/09/2023.
//

import SwiftUI

struct GridLayout: View {
    //@Binding var showingGrid: Bool
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        //NavigationView {
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                                )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            //.navigationTitle("Moonshot")
            //.toolbar {
            //    Button("List View") {
            //        showingGrid = false
            //    }
            //}
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            
            // Navigation View closing brace below
        //}
    }
}

struct GridLayout_Previews: PreviewProvider {
    // @State static var showingGrid: Bool = true
    
    static var previews: some View {
        // GridLayout(showingGrid: $showingGrid)
        GridLayout()
    }
}
