//
//  ContentView.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var teams : [Team] = [Team]()
    
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
            Button("Click for teams") {
                Task {
                    await getTeams(4)
                }
            }
        }
        .padding()
//        .onAppear(perform: {
//            apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
//        })
    }
    
    func getTeams(_ numTeams: Int = 25) async {
        let ds = FootballDataSource()
        
        teams = await ds.getTeamsList(numTeams)
    }
}

#Preview {
    ContentView()
}
