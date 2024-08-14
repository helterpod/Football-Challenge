//
//  TeamSummary.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 13/08/2024.
//

import SwiftUI

struct TeamSummary: View {
    var team: Team = Team()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Team name: \t\(team.shortName ?? "Nil")")
            Text("Founded: \t\t\(String(team.founded ?? 0))")
            Text("Ground: \t\t\(team.venue ?? "Nil")")
        }
        .font(Font.system(size: 14))
        .bold()
    }
}

#Preview {
    TeamSummary(team: Team(id: 1, name: "Wantage Town", shortName: "Wantage", tla: "WAN", founded: 1897, venue: "Manor Road"))
}
