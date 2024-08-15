//
//  ContentView.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var teams : [Team] = [Team]()
    @State var comps : [Competition] = [Competition]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            List(teams) { team in
                VStack(alignment: .leading) {
                    TeamSummary(team: team)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            Spacer()
            HStack {
                Button("Click for teams") {
                    Task {
                        await getTeams(4)
                    }
                }

                Button("Click for comps") {
                    Task {
                        await getCompetitions([2032, 2072])
                    }
                }

            }
        }
        .padding()
    }
    
    func getTeams(_ numTeams: Int = 25) async {
        let ds = FootballDataSource()
        
        teams = await ds.getTeamsList(numTeams)
    }
    
    func getCompetitions(_ areas: [Int] = [Int]()) async {
        let ds = FootballDataSource()
        
        comps = await ds.getCompetitionsList(areas)
    }
}

#Preview {
    ContentView()
}
